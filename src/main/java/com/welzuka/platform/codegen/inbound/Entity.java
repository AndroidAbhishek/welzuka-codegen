package com.welzuka.platform.codegen.inbound;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class Entity {

    @JsonProperty("EntityName")
    String entityName;

    @JsonProperty("EntityDescription")
    String entityDescription;

    @JsonProperty("Dependencies")
    List<String> dependencies;

    @JsonProperty("IsRestRequired")
    Boolean isRestRequired;

    @JsonProperty("Fields")
    List<Field> fields;

    @JsonProperty("Relationships")
    Relationship relationships;


    public String getEntityName() {
        return entityName;
    }

    public void setEntityName(String entityName) {
        this.entityName = entityName;
    }

    public String getEntityDescription() {
        return entityDescription;
    }

    public void setEntityDescription(String entityDescription) {
        this.entityDescription = entityDescription;
    }

    public List<Field> getFields() {
        return fields;
    }

    public void setFields(List<Field> fields) {
        this.fields = fields;
    }

    public Relationship getRelationships() {
        return relationships;
    }

    public void setRelationships(Relationship relationships) {
        this.relationships = relationships;
    }

    public Boolean getRestRequired() {
        return isRestRequired;
    }

    public void setRestRequired(Boolean restRequired) {
        isRestRequired = restRequired;
    }

    public List<String> getDependencies() {
        return dependencies;
    }

    public void setDependencies(List<String> dependencies) {
        this.dependencies = dependencies;
    }
}
