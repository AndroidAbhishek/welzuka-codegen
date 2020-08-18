package com.welzuka.platform.codegen.inbound;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class Component {

    @JsonProperty("ProjectName")
    String projectName;

    @JsonProperty("ComponentName")
    String componentName;

    @JsonProperty("WelzukaPlatformStarterVersion")
    String welzukaPlatformStarterVersion;

    @JsonProperty("WelzukaPlatformCommonsVersion")
    String welzukaPlatformCommonsVersion;

    @JsonProperty("ComponentVersion")
    String componentVersion;

    @JsonProperty("ComponentType")
    String componentType;

    @JsonProperty("Entities")
    List<Entity> entities;

    @JsonProperty("Enumerations")
    List<Enumeration> enumerations;

    public String getComponentName() {
        return componentName;
    }

    public void setComponentName(String componentName) {
        this.componentName = componentName;
    }

    public List<Entity> getEntities() {
        return entities;
    }

    public void setEntities(List<Entity> entities) {
        this.entities = entities;
    }

    public List<Enumeration> getEnumerations() {
        return enumerations;
    }

    public void setEnumerations(List<Enumeration> enumerations) {
        this.enumerations = enumerations;
    }

    public String getProjectName() {
        return projectName;
    }

    public void setProjectName(String projectName) {
        this.projectName = projectName;
    }


    public String getWelzukaPlatformStarterVersion() {
        return welzukaPlatformStarterVersion;
    }

    public void setWelzukaPlatformStarterVersion(String welzukaPlatformStarterVersion) {
        this.welzukaPlatformStarterVersion = welzukaPlatformStarterVersion;
    }

    public String getComponentVersion() {
        return componentVersion;
    }

    public void setComponentVersion(String componentVersion) {
        this.componentVersion = componentVersion;
    }

    public String getComponentType() {
        return componentType;
    }

    public void setComponentType(String componentType) {
        this.componentType = componentType;
    }

    public String getWelzukaPlatformCommonsVersion() {
        return welzukaPlatformCommonsVersion;
    }

    public void setWelzukaPlatformCommonsVersion(String welzukaPlatformCommonsVersion) {
        this.welzukaPlatformCommonsVersion = welzukaPlatformCommonsVersion;
    }
}
