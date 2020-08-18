package com.welzuka.platform.codegen.inbound;

import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.List;

public class Enumeration {

    @JsonProperty("EnumName")
    String enumName;

    @JsonProperty("Values")
    List<Object> values;

    public String getEnumName() {
        return enumName;
    }

    public void setEnumName(String enumName) {
        this.enumName = enumName;
    }

    public List<Object> getValues() {
        return values;
    }

    public void setValues(List<Object> values) {
        this.values = values;
    }
}
