package com.doubles.mvcboard.commons.aop;

import java.util.Arrays;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component
@Aspect
public class LogAdvice {
	
	private static final Logger logger = LoggerFactory.getLogger(LogAdvice.class);
	
	@Around("execution(* com.doubles.mvcboard..*Controller.*(..))"
			+ " or execution(* com.doubles.mvcboard..service..*Impl.*(..))"
			+ " or execution(* com.doubles.mvcboard..persistence..*Impl.*(..))")
	public Object logPrint(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
		
		long start = System.currentTimeMillis();
		
		Object result = proceedingJoinPoint.proceed();
		
		String type = proceedingJoinPoint.getSignature().getDeclaringTypeName();
		String name= "";
		
		if(type.contains("Controller")) {
			name = "Controller : ";
		
		}else if (type.contains("Service")) {
			name = "Service : ";
		
		}else if(type.contains("DAO")) {
			name = "Persistence : ";
		}
		
		long end = System.currentTimeMillis();
		
		System.out.println(name + type + "." + proceedingJoinPoint.getSignature().getName() + "()");
		System.out.println("Argument/Parameter : " + Arrays.toString(proceedingJoinPoint.getArgs()));
		System.out.println("Runnig Time : " + (end-start));
		System.out.println("-------------------------------------------------------");
		
		return result;
		
	}
}
