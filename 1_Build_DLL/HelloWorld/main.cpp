//////////////////////////////////////////////////////////////////
/// \file	 main.cpp
/// \author  Anthony DENTINGER
/// \version 1.0
/// \since	 2016-09-10
/// 
/// Defines the functions exported by the DLL.
//////////////////////////////////////////////////////////////////


#pragma once
#include "main.h"


void extensionInitializer(
	void** extData,
	FREContextInitializer* ctxInitializer,
	FREContextFinalizer* ctxFinalizer)
{
	// DLL's entry point from the AS3 runtime.

	*ctxInitializer = &contextInitializer;	// Tells the AS3 runtime where to find the context
											// initializer. Forgetting this will cause Error #3500,
											// because your functions will never be addeed to the
											// extension context.

	*ctxFinalizer   = &contextFinalizer;
}



void extensionFinalizer(
	void* extData)
{ }


// Initializes the extension context by adding the "helloWorld"
// function to it. Not adding the "helloWorld" function will cause
// Error #3500.
void contextInitializer(
	void					 * extData,
	const uint8_t			 * ctxType,
	FREContext				   ctx,
	uint32_t				 * numFunctionsToSet,
	const FRENamedFunction	** functionsToSet)
{
	static FRENamedFunction extensionFunctions[] =
	{
		{ (const uint8_t*) "helloWorld", NULL, &helloWorld }
	};

	*numFunctionsToSet = sizeof(extensionFunctions) / sizeof(FRENamedFunction);

	*functionsToSet = extensionFunctions;
}



void contextFinalizer(
	FREContext ctx)
{ }



FREObject helloWorld(
	FREContext ctx,
	void* funcData,
	uint32_t argc,
	FREObject argv[])
{
	char* hello = "Hello, World!";
	unsigned int helloLength = strlen(hello) + 1;
	FREObject ret;

	FRENewObjectFromUTF8(helloLength, (const uint8_t*)hello, &ret);

	return ret;
}