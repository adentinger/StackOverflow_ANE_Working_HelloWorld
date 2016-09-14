//////////////////////////////////////////////////////////////////
/// \file	 main.h
/// \author  Anthony DENTINGER
/// \version 1.0
/// \since	 2016-09-10
/// 
/// Specifies to MSVC which functions to include in the DLL,
/// as well as their prototype.
//////////////////////////////////////////////////////////////////

#pragma once
#include <cstring>

#include "FlashRuntimeExtensions.h"


#pragma region Macros & typedefs

#ifdef HELLOWORLD_EXPORTS
#define HELLOWORLD_API __declspec(dllexport)
#else
#define HELLOWORLD_API __declspec(dllimport)
#endif

#pragma endregion


#ifdef __cplusplus
extern "C"
{
#endif

	HELLOWORLD_API void extensionInitializer(
		void** dataToSet,
		FREContextInitializer* contextInitializer,
		FREContextFinalizer* contextFinalizer);


	HELLOWORLD_API void extensionFinalizer(
		void* extData);
#ifdef __cplusplus
}
#endif


HELLOWORLD_API void contextInitializer(
	void* contextData,
	const uint8_t* contextType,
	FREContext context,
	uint32_t* nFunctionsToSet,
	const FRENamedFunction** functionsToSet);


HELLOWORLD_API void contextFinalizer(
	FREContext context);


HELLOWORLD_API FREObject helloWorld(
	FREContext context,
	void* functionData,
	uint32_t argc,
	FREObject argv[]);