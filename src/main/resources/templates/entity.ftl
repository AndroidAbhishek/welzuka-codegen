package com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.domain;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.util.List;
import com.fasterxml.jackson.annotation.JsonIgnore;
import java.util.Date;
import com.welzuka.domain.Auditable;
import java.io.Serializable;

<#if enums??>
<#list enums as enum>
import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.enumeration.${enum};
</#list>
</#if>

@Entity
public class ${entity.entityName} extends Auditable<String> implements Serializable {

    <#list entity.fields as field>
    <#if field.dataType == "Id">
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
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
     <#if field.isUnique??>
     <#if field.isUnique == true>
    @NotNull(message = "Please provide ${field.fieldName}")
    @Column(name = "${field.columnName?lower_case}", nullable = false, unique = true, updatable = false)
    <#else>
    @NotNull(message = "Please provide ${field.fieldName}")
    @Column(name = "${field.columnName?lower_case}", nullable = false)
    </#if>
    </#if>
    <#if field.isNullable == true>
    @Column(name = "${field.columnName?lower_case}", nullable = true)
    </#if>
    <#else>
    @Column(name = "${field.columnName?lower_case}")
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
    @JsonIgnore
    @OneToMany(mappedBy = "${entity.entityName?uncap_first}", cascade = CascadeType.ALL,fetch = FetchType.EAGER)
    private List<${child}> ${child?uncap_first+"s"};

    public List<${child}> get${child+"s"}() {
        return ${child?uncap_first+"s"};
    }

    public void set${child+"s"}(List<${child}> ${child?uncap_first+"s"}) {
        this.${child?uncap_first+"s"} = ${child?uncap_first+"s"};
    }
    </#list>
    </#if>

    <#if entity.relationships.parent??>
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name="${entity.relationships.parent.entity?uncap_first+"_id"}")
    private ${entity.relationships.parent.entity} ${entity.relationships.parent.entity?uncap_first};

    public ${entity.relationships.parent.entity} get${entity.relationships.parent.entity}() {
        return ${entity.relationships.parent.entity?uncap_first};
    }

    public void set${entity.relationships.parent.entity}(${entity.relationships.parent.entity} ${entity.relationships.parent.entity?uncap_first}) {
        this.${entity.relationships.parent.entity?uncap_first} = ${entity.relationships.parent.entity?uncap_first};
    }
    </#if>

   <#if entity.relationships.referenceFrom??>
   <#list entity.relationships.referenceFrom as fromReference>
   @OneToOne(cascade = CascadeType.REMOVE)
   @JoinColumn(name = "${fromReference.from?uncap_first+"_id"}", referencedColumnName="${fromReference.from?uncap_first+"_id"}")
   private ${fromReference.from} ${fromReference.from?uncap_first};

   public ${fromReference.from} get${fromReference.from}() {
       return ${fromReference.from?uncap_first};
   }

   public void set${fromReference.from}(${fromReference.from} ${fromReference.from?uncap_first}) {
       this.${fromReference.from?uncap_first} = ${fromReference.from?uncap_first};
   }
   </#list>
   </#if>
    </#if>
}