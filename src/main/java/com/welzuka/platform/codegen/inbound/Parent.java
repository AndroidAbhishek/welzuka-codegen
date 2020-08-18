package com.welzuka.platform.codegen.inbound;

import com.fasterxml.jackson.annotation.JsonProperty;

public class Parent {

    @JsonProperty("Entity")
    String entity;

    @JsonProperty("ReferenceKey")
    String referenceKey;

    public String getEntity() {
        return entity;
    }

    public void setEntity(String entity) {
        this.entity = entity;
    }

    public String getReferenceKey() {
        return referenceKey;
    }

    public void setReferenceKey(String referenceKey) {
        this.referenceKey = referenceKey;
    }
}
