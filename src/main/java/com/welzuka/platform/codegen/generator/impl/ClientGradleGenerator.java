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
import java.util.Map;

public class ClientGradleGenerator {

    private static ClientGradleGenerator engine = new ClientGradleGenerator();
    private Template template=null;
    Map<String, Object> dataMap = new HashMap<String, Object>();
    private ClientGradleGenerator()
    {
        init();
    }
    private void init()
    {
        Configuration cfg = new Configuration();
        try {
            cfg.setClassForTemplateLoading(this.getClass(), "/templates/");
            template = cfg.getTemplate("clientGradle.ftl");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }


    public static ClientGradleGenerator get()
    {
        return engine;
    }

    public ClientGradleGenerator buildData(String componentName, Component component)
    {
        dataMap.put("componentName",componentName);
        dataMap.put("projectName",component.getProjectName());
        dataMap.put("welzukaPlatformStarterVersion",component.getWelzukaPlatformStarterVersion());
        dataMap.put("welzukaPlatformCommonsVersion",component.getWelzukaPlatformCommonsVersion());
        dataMap.put("componentVersion",component.getComponentVersion());
        return engine;
    }


    public void  writeFile(File fileDir)
    {
        Writer fileWriter=null;
        try {
            File file = new File(fileDir.getAbsolutePath()+"/build.gradle");
            fileWriter = new FileWriter(file);
            template.process(dataMap, fileWriter);
            fileWriter.flush();
            System.out.println("Generated: Client gradle file");
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
