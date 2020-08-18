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

public class DTOFacadeGenerator {

    private static DTOFacadeGenerator engine = new DTOFacadeGenerator();
    private Template template=null;
    Map<String, Object> dataMap = new HashMap<String, Object>();
    private DTOFacadeGenerator()
    {
        init();
    }
    private void init()
    {
        Configuration cfg = new Configuration();
        try {
            cfg.setClassForTemplateLoading(this.getClass(), "/templates/");
            template = cfg.getTemplate("dtoFacade.ftl");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public static DTOFacadeGenerator get()
    {
        return engine;
    }

    public DTOFacadeGenerator buildData(String componentName, Component component, Entity entity, List<String> enums)
    {
        dataMap.put("componentName",componentName);
        dataMap.put("entity",entity);
        dataMap.put("projectName",component.getProjectName());
        dataMap.put("enums",enums);
        return engine;
    }


    public void  writeFile(String className, File fileDir)
    {
        Writer fileWriter=null;
        try {
            File file = new File(fileDir.getAbsolutePath()+"/"+className+"DTO.java");
            fileWriter = new FileWriter(file);
            template.process(dataMap, fileWriter);
            fileWriter.flush();
            System.out.println("Generated: "+className+"DTO.java");
        }catch (Exception e) {
            e.printStackTrace();
        }
        finally
        {
            try {
                fileWriter.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
    }
}
