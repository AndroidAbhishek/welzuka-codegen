package com.welzuka.platform.codegen.outbound;

public class Repository {

    public Repository(String modelName) {
        this.modelName = modelName;
    }

    public String modelName;

    public String getModelName() {
        return modelName;
    }

    public void setModelName(String modelName) {
        this.modelName = modelName;
    }
}
