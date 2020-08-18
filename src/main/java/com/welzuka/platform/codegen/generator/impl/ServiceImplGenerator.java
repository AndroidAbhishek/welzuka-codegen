package com.welzuka.platform.codegen.generator.impl;

import com.welzuka.platform.codegen.inbound.Component;
import com.welzuka.platform.codegen.inbound.Entity;
import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class ServiceImplGenerator {
    private static ServiceImplGenerator engine = new ServiceImplGenerator();
    private Template template=null;
    Map<String, Object> dataMap = new HashMap<String, Object>();
    private ServiceImplGenerator()
    {
        init();
    }

    private void init()
    {
        Configuration cfg = new Configuration();
        try {
            cfg.setClassForTemplateLoading(this.getClass(), "/templates/");
            template = cfg.getTemplate("serviceImpl.ftl");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public static ServiceImplGenerator get()
    {
        return engine;
    }

    public ServiceImplGenerator buildData(String componentName, Component component,Entity entity)
    {
        dataMap.put("componentName",componentName);
        dataMap.put("projectName",component.getProjectName());
        dataMap.put("entity",entity);
        return engine;
    }

    public void  writeFile(String className, Component component, File fileDir)
    {
        File temp = new File("./src/main/java/com/"+component.getProjectName()+"/"
                +component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/service/impl/"+className+"ServiceImpl.java");
        if (!temp.exists()) {
            Writer fileWriter = null;
            try {
                File file = new File(fileDir.getAbsolutePath() + "/" + className + "ServiceImpl.java");
                fileWriter = new FileWriter(file);
                template.process(dataMap, fileWriter);
                fileWriter.flush();
                System.out.println("Generated: " + className + "ServiceImpl.java");
            } catch (Exception e) {
                e.printStackTrace();
            } finally {
                try {
                    fileWriter.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}
