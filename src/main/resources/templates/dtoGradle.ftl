plugins {
    id 'java'
    id 'maven'
    id 'maven-publish'
}

group 'com.${projectName?lower_case}.${componentName?lower_case}.dto'
version '${componentVersion}'

sourceCompatibility = 1.8

ext {
    set('springCloudVersion', "Edgware.SR5")
    awsAccessKeyId = System.env.AWS_ACCESS_KEY_ID ?: findProperty('aws_access_key_id')
    awsSecretAccessKey = System.env.AWS_SECRET_ACCESS_KEY ?: findProperty('aws_secret_access_key')
}

repositories {
    mavenLocal()
    mavenCentral()
    maven {
    		url "s3://maven-nested-repo/releases"
    		credentials(AwsCredentials) {
    			accessKey = awsAccessKeyId
    			secretKey = awsSecretAccessKey
    	}
    }
}

sourceSets {
	main {
		java {
			srcDirs 'gensrc/main/java'
			srcDirs 'src/main/java'
		}
	}
}

dependencies {
    compile "com.welzuka.starter:welzuka-base-starter:${welzukaPlatformStarterVersion}"
    testCompile group: 'junit', name: 'junit', version: '4.12'
}

dependencyManagement {
    imports {
        mavenBom "org.springframework.cloud:spring-cloud-dependencies:Edgware.SR5"
    }
}

publishing {
	publications {
		myLibrary(MavenPublication) {
			from components.java
		}
	}
	repositories {
		maven {
			url = "s3://maven-nested-repo/releases"
			credentials(AwsCredentials) {
				accessKey = awsAccessKeyId
				secretKey = awsSecretAccessKey
			}
		}
	}
}
