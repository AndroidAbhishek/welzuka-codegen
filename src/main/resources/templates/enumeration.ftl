package com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.enumeration;


public enum ${enumeration.enumName}{

    <#list 0..enumeration.values?size-1 as i>
    ${enumeration.values[i]?upper_case}("${enumeration.values[i]}")
    <#if i==enumeration.values?size-1>
    ;
    <#else>
    ,
    </#if>
    </#list>

    private String value;

    public String getValue(){
        return this.value;
    }

    ${enumeration.enumName}(String value){
        this.value = value;
    }
}