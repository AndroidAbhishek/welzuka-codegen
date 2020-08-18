package com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.dto;
import com.${projectName?lower_case}.*;
<#if enums??>
<#list enums as enum>
import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.enumeration.${enum};
</#list>
</#if>

import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.util.Objects;
import java.util.Date;
import java.util.List;

public class ${entity.entityName}DTO implements Serializable{

    <#list entity.fields as field>
    <#if field.dataType == "Id">
    private Long ${field.fieldName?uncap_first};

    public void set${field.fieldName}(Long ${field.fieldName?uncap_first}){
        this.${field.fieldName?uncap_first} = ${field.fieldName?uncap_first};
    }

    public Long get${field.fieldName}(){
        return this.${field.fieldName?uncap_first};
    }

    <#else>
     <#if field.isNullable??>
     <#if field.isNullable == false>
    @NotNull
    </#if>
    </#if>
    private ${field.dataType} ${field.fieldName?uncap_first};

    public void set${field.fieldName}(${field.dataType} ${field.fieldName?uncap_first}){
        this.${field.fieldName?uncap_first} = ${field.fieldName?uncap_first};
    }

    public ${field.dataType} get${field.fieldName}(){
        return this.${field.fieldName?uncap_first};
    }

    </#if>
    </#list>
    <#if entity.relationships??>
    <#if entity.relationships.children??>
    <#list entity.relationships.children as child>
    private List<${child}DTO> ${child?uncap_first+"s"};

    public List<${child}DTO> get${child+"s"}() {
        return ${child?uncap_first+"s"};
    }

    public void set${child+"s"}(List<${child}DTO> ${child?uncap_first+"s"}) {
        this.${child?uncap_first+"s"} = ${child?uncap_first+"s"};
    }
    </#list>
    </#if>

    <#if entity.relationships.parent??>
    @NotNull
    private ${entity.relationships.parent.entity}DTO ${entity.relationships.parent.entity?uncap_first};

    public ${entity.relationships.parent.entity}DTO get${entity.relationships.parent.entity}() {
        return ${entity.relationships.parent.entity?uncap_first};
    }

    public void set${entity.relationships.parent.entity}(${entity.relationships.parent.entity}DTO ${entity.relationships.parent.entity?uncap_first}) {
        this.${entity.relationships.parent.entity?uncap_first} = ${entity.relationships.parent.entity?uncap_first};
    }
    </#if>

   <#if entity.relationships.referenceFrom??>
   <#list entity.relationships.referenceFrom as fromReference>
   private ${fromReference.from}DTO ${fromReference.from?uncap_first};

   public ${fromReference.from}DTO get${fromReference.from}() {
       return ${fromReference.from?uncap_first};
   }

   public void set${fromReference.from}(${fromReference.from}DTO ${fromReference.from?uncap_first}) {
       this.${fromReference.from?uncap_first} = ${fromReference.from?uncap_first};
   }
   </#list>
   </#if>
    </#if>
}