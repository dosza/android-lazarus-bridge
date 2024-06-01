#!/usr/bin/env bash 

LIB_PATH=./Eq2PasBridge/jni/libs/armeabi-v7a/libeq2pasbridge.so
TARGET_LIB=./mobile/AppEq2SolverBridge/AppEq2Solver/app/src/main/jniLibs/armeabi-v7a

getCurrentLibSum(){

	current_lib_sum="$(
		sha256sum $LIB_PATH | 
		sed 's/[[:blank:]].*//g'
	)"
}

updateDotEnv(){
	[ ! -e ./.env ]  && return 1
	getCurrentLibSum
	
	sed  -i "s/$LIB_SUM/$current_lib_sum/g" ./.env

}

createDotEnv(){
	
	[ -e ./.env ] && return 1
	getCurrentLibSum
	echo "LIB_SUM=${current_lib_sum}" >> ./.env

}

checkIfExistsLibrary(){
	[  -e $LIB_PATH ]
}

if [ -e ./.env ]; then
	. ./.env

	if ! checkIfExistsLibrary; then
		exit 1
	fi

	if [ ! -e $TARGET_LIB ]; then
		mkdir -p $TARGET_LIB
	fi

	getCurrentLibSum
	if [ "$current_lib_sum" != "$LIB_SUM" ] || [ ! -e "$TARGET_LIB/libeq2pasbridge.so" ];then
		echo "updating .env"
		updateDotEnv
		cp $LIB_PATH $TARGET_LIB
	else 
		echo "Already update $LIB_PATH"
	fi

else
	echo "creating .env"
	if ! checkIfExistsLibrary; then
		echo "$LIB_PATH does not exists!"
		echo "rebuild your library"
		exit 1
	fi
	createDotEnv
	cp $LIB_PATH $TARGET_LIB
fi