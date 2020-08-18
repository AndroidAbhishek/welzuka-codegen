package com.welzuka.platform.codegen;

import com.welzuka.platform.codegen.generator.impl.*;
import com.welzuka.platform.codegen.inbound.Component;
import com.welzuka.platform.codegen.inbound.Entity;
import com.welzuka.platform.codegen.inbound.Enumeration;
import com.welzuka.platform.codegen.reader.ComponentJSONParser;
import org.json.simple.JSONObject;

import java.io.File;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

public class CodeGenerator {
    
    public static void main(String[] args) {
        ComponentJSONParser componentJSONParser = new ComponentJSONParser();
        JSONObject componentJsonObject = componentJSONParser.readJsonFile();
        Component component = componentJSONParser.parseJson(componentJsonObject);
        CodeGenerator generator = new CodeGenerator();
        if (component.getComponentType().equals("DOMAIN")){
            generator.domainGenerator(component);
        }
        else if (component.getComponentType().equals("AGGREGATOR")){
            generator.aggregatorGenerator(component);
        }
        else {
            System.out.println("Please select an appropriate Component Type");
        }

    }

    public void aggregatorGenerator(Component component){
        System.out.println(component.getComponentName());
        System.out.println(component.getComponentVersion());
        File rest = new File("./gensrc/main/java/com/"+component.getProjectName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/rest");
        File service = new File("./gensrc/main/java/com/"+component.getProjectName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/service");
        File dto = new File("./dto/gensrc/main/java/com/"+component.getProjectName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/dto");
        File dtoMain = new File("./gensrc/main/java/com/"+component.getProjectName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/dto");
        File client = new File("./client/gensrc/main/java/com/"+component.getProjectName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/client");
        File clientGradle = new File("./client/");
        File dtoGradle = new File("./dto/");
        File serviceImpl = new File("./gensrc/main/java/com/"+component.getProjectName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/service/impl");
        if (!rest.mkdirs()){
            System.out.println("Could not create Controllers");
        }
        if (!service.mkdirs()){
            System.out.println("Could not create Services");
        }
        if (!dto.mkdirs()){
            System.out.println("Could not create DTO");
        }
        if (!dtoMain.mkdirs()){
            System.out.println("Could not create DTO");
        }
        if (!serviceImpl.mkdirs()){
            System.out.println("Could not create ServiceImpl");
        }
        if (!client.mkdirs()){
            System.out.println("Could not create Clients");
        }
        if (!clientGradle.mkdirs()){
            System.out.println("Could not create ClientGradle");
        }
        if (!dtoGradle.mkdirs()){
            System.out.println("Could not create dtoGradle");
        }
        List<String> enums = new ArrayList<>();
        ClientGradleGenerator.get().buildData(component.getComponentName(),component).writeFile(clientGradle);
        //DtoGradleGenerator.get().buildData(component.getComponentName(),component).writeFile(dtoGradle);

        for (Entity entity : component.getEntities()) {
            DTOFacadeGenerator.get().buildData(component.getComponentName(),component,entity,enums).writeFile(entity.getEntityName(),dto);
            DTOFacadeGenerator.get().buildData(component.getComponentName(),component,entity,enums).writeFile(entity.getEntityName(),dtoMain);
            ServiceFacadeGenerator.get().buildData(component.getComponentName(),component,entity).writeFile(entity.getEntityName(),component,service);
            ServiceImplFacadeGenerator.get().buildData(component.getComponentName(),component,entity).writeFile(entity.getEntityName(),component,serviceImpl);
            if (entity.getRestRequired()){
                ControllerFacadeGenerator.get().buildData(component.getComponentName(),component,entity).writeFile(entity.getEntityName(),component,rest);
                ClientFacadeGenerator.get().buildData(component.getComponentName(),component,entity).writeFile(entity.getEntityName(),client);
            }
        }
    }

    public void domainGenerator(Component component){
        System.out.println(component.getComponentName());
        System.out.println(component.getComponentVersion());
        File domain = new File("./gensrc/main/java/com/"+component.getProjectName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/domain");
        File enumerationDir = new File("./dto/gensrc/main/java/com/"+component.getProjectName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/enumeration");
        File enumerationMainDir = new File("./gensrc/main/java/com/"+component.getProjectName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/enumeration");
        File repository = new File("./gensrc/main/java/com/"+component.getProjectName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/repository");
        File rest = new File("./gensrc/main/java/com/"+component.getProjectName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/rest");
        File service = new File("./gensrc/main/java/com/"+component.getProjectName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/service");
        File dto = new File("./dto/gensrc/main/java/com/"+component.getProjectName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/dto");
        File dtoMain = new File("./gensrc/main/java/com/"+component.getProjectName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/dto");
        File client = new File("./client/gensrc/main/java/com/"+component.getProjectName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/client");
        File clientGradle = new File("./client/");
        File dtoGradle = new File("./dto/");
        File serviceImpl = new File("./gensrc/main/java/com/"+component.getProjectName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/service/impl");
        File specification = new File("./gensrc/main/java/com/"+component.getProjectName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/specification");
        File mapper = new File("./gensrc/main/java/com/"+component.getProjectName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/service/mapper");
        File mapperImpl = new File("./gensrc/main/java/com/"+component.getProjectName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/service/mapper/impl");
        if (!specification.mkdirs()){
            System.out.println("Could not create Specification");
        }
        if (!domain.mkdirs()){
            System.out.println("Could not create Domain");
        }
        if (!enumerationDir.mkdirs()){
            System.out.println("Could not create Enums");
        }
        if (!enumerationMainDir.mkdirs()){
            System.out.println("Could not create Enums");
        }
        if (!repository.mkdirs()){
            System.out.println("Could not create Repos");
        }
        if (!rest.mkdirs()){
            System.out.println("Could not create Controllers");
        }
        if (!service.mkdirs()){
            System.out.println("Could not create Services");
        }
        if (!dto.mkdirs()){
            System.out.println("Could not create DTO");
        }
        if (!dtoMain.mkdirs()){
            System.out.println("Could not create DTO");
        }
        if (!serviceImpl.mkdirs()){
            System.out.println("Could not create ServiceImpl");
        }
        if (!mapper.mkdirs()){
            System.out.println("Could not create Mapper");
        }
        if (!mapperImpl.mkdirs()){
            System.out.println("Could not create MapperImpl");
        }
        if (!client.mkdirs()){
            System.out.println("Could not create Clients");
        }
        if (!clientGradle.mkdirs()){
            System.out.println("Could not create ClientGradle");
        }
        if (!dtoGradle.mkdirs()){
            System.out.println("Could not create dtoGradle");
        }
        List<String> enums = new ArrayList<>();
        ClientGradleGenerator.get().buildData(component.getComponentName(),component).writeFile(clientGradle);
        DtoGradleGenerator.get().buildData(component.getComponentName(),component).writeFile(dtoGradle);

        if (null!=component.getEnumerations()) {
            component.getEnumerations().forEach(enumeration -> {
                enums.add(enumeration.getEnumName());
            });
            for (Enumeration enumeration: component.getEnumerations()){
                EnumerationGenerator.get().buildData(component.getComponentName(),component,enumeration).writeFile(enumeration.getEnumName(),enumerationDir);
                EnumerationGenerator.get().buildData(component.getComponentName(),component,enumeration).writeFile(enumeration.getEnumName(),enumerationMainDir);
            }
        }
        for (Entity entity : component.getEntities()) {
            EntityGenerator.get().buildData(component.getComponentName(),component,entity,enums).writeFile(entity.getEntityName(),component,domain);
            RepositoryGenerator.get().buildData(component.getComponentName(),component,entity).writeFile(entity.getEntityName(),component,repository);
            DTOGenerator.get().buildData(component.getComponentName(),component,entity,enums).writeFile(entity.getEntityName(),dto);
            DTOGenerator.get().buildData(component.getComponentName(),component,entity,enums).writeFile(entity.getEntityName(),dtoMain);
            ServiceGenerator.get().buildData(component.getComponentName(),component,entity).writeFile(entity.getEntityName(),component,service);
            ServiceImplGenerator.get().buildData(component.getComponentName(),component,entity).writeFile(entity.getEntityName(),component,serviceImpl);
            SpecificationGenerator.get().buildData(component.getComponentName(),component,entity).writeFile(entity.getEntityName(),component,specification);
            MapperGenerator.get().buildData(component.getComponentName(),component,entity).writeFile(entity.getEntityName(),component,mapper);
            MapperImplGenerator.get().buildData(component.getComponentName(),component,entity).writeFile(entity.getEntityName(),component,mapperImpl);
            if (entity.getRestRequired()){
                ControllerGenerator.get().buildData(component.getComponentName(),component,entity).writeFile(entity.getEntityName(),component,rest);
                ClientGenerator.get().buildData(component.getComponentName(),component,entity).writeFile(entity.getEntityName(),client);
            }
        }
    }
}