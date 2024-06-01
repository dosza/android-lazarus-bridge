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

existsDotEnv(){
	[ -e ./.env ]
}

loadLibSum(){
	[ ! -e ./.env ] && return 
	LIB_SUM="$(grep LIB_SUM= ./.env | awk -F= '{ print $2 } ')"
}

createTargetLib(){
	if [ ! -e $TARGET_LIB ]; then
		mkdir -p $TARGET_LIB
	fi
}

isRequireUpdateLibrary(){
	[ "$current_lib_sum" != "$LIB_SUM" ] || 
	[ ! -e "$TARGET_LIB/libeq2pasbridge.so" ]
}

checkIfCannotStart(){
	if ! checkIfExistsLibrary; then
		echo "$LIB_PATH does not exists!"
		echo "rebuild your library"
		exit 1
	fi
}

updateLibrary(){
	
	loadLibSum
	getCurrentLibSum

	if ! isRequireUpdateLibrary ;then
		echo "Already update $LIB_PATH"; return
	fi

	echo "updating .env"
	updateDotEnv
	cp $LIB_PATH $TARGET_LIB

}

main(){

	checkIfCannotStart
	createTargetLib
	
	if existsDotEnv;then 
		updateLibrary
	else
		echo "creating .env"
		createDotEnv
		cp $LIB_PATH $TARGET_LIB
	fi	
}

main