package com.welzuka.platform.codegen.inbound;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;

public class Field {

    @JsonProperty("Type")
    public String dataType;

    @JsonProperty("FieldName")
    public String fieldName;

    @JsonIgnore
    public Boolean isPrimary;

    @JsonProperty("IsNullable")
    public Boolean isNullable;

    @JsonProperty("IsEnumeration")
    public Boolean isEnumeration;


    @JsonProperty("IsUnique")
    public Boolean isUnique;

    @JsonIgnore
    public String columnName;

    @JsonProperty("IsList")
    public Boolean isList;

    public Boolean getIsNullable() {
        return isNullable;
    }

    public void setIsNullable(Boolean isNullable) {
        this.isNullable = isNullable;
    }

    public Boolean getIsPrimary() {
        return isPrimary;
    }

    public void setIsPrimary(Boolean isPrimary) {
        this.isPrimary = isPrimary;
    }

    public String getColumnName() {
        return columnName;
    }

    public void setColumnName(String columnName) {
        this.columnName = columnName;
    }

    public String getFieldName() {
        return fieldName;
    }

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
    }

    public String getDataType() {
        return dataType;
    }

    public void setDataType(String dataType) {
        this.dataType = dataType;
    }

    public Boolean getEnumeration() {
        return isEnumeration;
    }

    public void setEnumeration(Boolean enumeration) {
        isEnumeration = enumeration;
    }

    public Boolean getIsUnique() {return isUnique;}

    public void setIsUnique(Boolean unique) {
        isUnique = unique;
    }

    public Boolean getIsList() {return isList;}

    public void setIsList(Boolean iList) {
        isList = iList;
    }


}
