package com.welzuka.platform.codegen.inbound;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.welzuka.platform.codegen.standard.RelationshipType;

import java.util.List;

public class Relationship {

    @JsonProperty("Children")
    List<String> children;

    @JsonProperty("ReferenceTo")
    List<String> referenceTo;

    @JsonProperty("Parent")
    Parent parent;

    @JsonProperty("ReferenceFrom")
    List<ReferenceFrom> referenceFrom;

    public List<String> getChildren() {
        return children;
    }

    public void setChildren(List<String> children) {
        this.children = children;
    }

    public List<String> getReferenceTo() {
        return referenceTo;
    }

    public void setReferenceTo(List<String> referenceTo) {
        this.referenceTo = referenceTo;
    }

    public Parent getParent() {
        return parent;
    }

    public void setParent(Parent parent) {
        this.parent = parent;
    }

    public List<ReferenceFrom> getReferenceFrom() {
        return referenceFrom;
    }

    public void setReferenceFrom(List<ReferenceFrom> referenceFrom) {
        this.referenceFrom = referenceFrom;
    }

}
