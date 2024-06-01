#!/usr/bin/env bash 


getCurrentLibSum(){
	current_lib_sum="$(
		sha256sum $LIB_PATH | 
		awk -F ' ' '{ print $1 }'| 
		sed 's/[[:blank:]]//g'
	)"
}

getLibSumFromDotEnv(){
	old_lib_sum="$(
		grep LIB_SUM $LIB_PATH | 
		awk -F "=" '{ print $2 }' |
		sed 's/[[:blank:]]//g'
	)"
}

updateDotEnv(){
	[ ! -e ./.env ]  && return 1

	local old_lib_sum

	getLibSumFromDotEnv
	getCurrentLibSum
	
	sed  -i "s/$old_lib_sum/$current_lib_sum/g" ./.env

}

createDotEnv(){
	
	[ -e ./.env ] && return 1

	getCurrentLibSum
	echo "LIB_PATH=./Eq2PasBridge/jni/libs/armeabi-v7a/libeq2pasbridge.so" > ./.env
	echo "TARGET_LIB=./AppEq2SolverBridge/AppEq2Solver/app/src/main/jniLibs" > ./.env
	echo "LIB_SUM=${current_lib_sum}" >> ./.env

}

if [ -e ./.env ]; then
	. ./.env

	if [ ! -e $LIB_PATH ]; then
		echo "$LIB_PATH does not exists!"
		echo "rebuild your library"
		exit 1
	fi

	if [ ! -e $TARGET_LIB ]; then
		mkdir -p $TARGET_LIB
	fi

	getCurrentLibSum
	if !( sha256sum $LIB_PATH | grep "$LIB_SUM" -q ) || [ ! -e "$TARGET_LIB/libeq2pasbridge.so" ];then
		echo "updating .env"
		updateDotEnv
		cp $LIB_PATH $TARGET_LIB
	else 
		echo "Already update $LIB_PATH"
	fi

else
	echo "creating .env"
	createDotEnv
fi