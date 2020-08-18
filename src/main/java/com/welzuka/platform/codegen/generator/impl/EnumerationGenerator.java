package com.welzuka.platform.codegen.generator.impl;

import com.welzuka.platform.codegen.inbound.Component;
import com.welzuka.platform.codegen.inbound.Entity;
import com.welzuka.platform.codegen.inbound.Enumeration;
import freemarker.template.Configuration;
import freemarker.template.Template;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EnumerationGenerator {

    private static EnumerationGenerator engine = new EnumerationGenerator();
    private Template template=null;
    Map<String, Object> dataMap = new HashMap<String, Object>();
    private EnumerationGenerator()
    {
        init();
    }
    private void init()
    {
        Configuration cfg = new Configuration();
        try {
            cfg.setClassForTemplateLoading(this.getClass(), "/templates/");
            template = cfg.getTemplate("enumeration.ftl");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static EnumerationGenerator get()
    {
        return engine;
    }

    public EnumerationGenerator buildData(String componentName, Component component, Enumeration enumeration)
    {
        dataMap.put("componentName",componentName);
        dataMap.put("projectName",component.getProjectName());
        dataMap.put("enumeration",enumeration);
        return engine;
    }


    public void  writeFile(String className, File fileDir)
    {
        Writer fileWriter=null;
        try {
            File file = new File(fileDir.getAbsolutePath()+"/"+className+".java");
            fileWriter = new FileWriter(file);
            template.process(dataMap, fileWriter);
            fileWriter.flush();
            System.out.println("Generated: "+className+".java");
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
