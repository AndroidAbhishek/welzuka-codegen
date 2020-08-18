package com.welzuka.platform.codegen.generator.impl;

import com.welzuka.platform.codegen.inbound.Component;
import com.welzuka.platform.codegen.inbound.Entity;
import com.welzuka.platform.codegen.outbound.Repository;
import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.Map;

public class RepositoryGenerator {
    private static RepositoryGenerator engine = new RepositoryGenerator();
    private Template template=null;
    Map<String, Object> dataMap = new HashMap<String, Object>();
    private RepositoryGenerator()
    {
        init();
    }
    private void init()
    {
        Configuration cfg = new Configuration();
        try {
            cfg.setClassForTemplateLoading(this.getClass(), "/templates/");
            template = cfg.getTemplate("repository.ftl");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public static RepositoryGenerator get()
    {
        return engine;
    }

    public RepositoryGenerator buildData(String componentName, Component component,Entity entity)
    {
        dataMap.put("componentName",componentName);
        dataMap.put("projectName",component.getProjectName());
        dataMap.put("entity",entity);
        return engine;
    }


    public void  writeFile(String className, Component component, File fileDir)
    {
        File temp = new File("./src/main/java/com/"+component.getProjectName()+"/"
                +component.getComponentName().toLowerCase()+"/"+component.getComponentName().toLowerCase()+"/repository/"+className+"Repository.java");
        if (!temp.exists()) {
            Writer fileWriter = null;
            try {
                File file = new File(fileDir.getAbsolutePath() + "/" + className + "Repository.java");
                fileWriter = new FileWriter(file);
                template.process(dataMap, fileWriter);
                fileWriter.flush();
                System.out.println("Generated: " + className + "Repository.java");
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
