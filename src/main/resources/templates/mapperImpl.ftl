package com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.service.mapper.impl;

import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.domain.${entity.entityName};
import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.dto.${entity.entityName}DTO;
import java.util.ArrayList;
import java.util.List;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.service.mapper.*;
import org.springframework.stereotype.Component;
import org.apache.commons.collections.CollectionUtils;

@Component
public class ${entity.entityName}MapperImpl implements ${entity.entityName}Mapper {

    <#if entity.relationships??>
    <#if entity.relationships.children??>
    <#list entity.relationships.children as child>
    @Autowired
    private ${child}Mapper ${child?uncap_first}Mapper;

    </#list>
    </#if>
    <#if entity.relationships.parent??>
    @Autowired
    private ${entity.relationships.parent.entity}Mapper ${entity.relationships.parent.entity?uncap_first}Mapper;
    </#if>
    <#if entity.relationships.referenceFrom??>
    <#list entity.relationships.referenceFrom as fromReference>
    @Autowired
    private ${fromReference.from}Mapper ${fromReference.from?uncap_first}Mapper;
    </#list>
    </#if>
    </#if>

    @Override
    public ${entity.entityName}DTO toDto(${entity.entityName} entity) {
        if ( entity == null ) {
            return null;
        }

        ${entity.entityName}DTO ${entity.entityName?uncap_first}DTO = new ${entity.entityName}DTO();
        <#list entity.fields as field>
        ${entity.entityName?uncap_first}DTO.set${field.fieldName}(entity.get${field.fieldName}());
        </#list>
        <#if entity.relationships??>
        <#if entity.relationships.children??>
        <#list entity.relationships.children as child>
        if(CollectionUtils.isNotEmpty(entity.get${child+"s"}())){
            ${entity.entityName?uncap_first}DTO.set${child+"s"}(${child?uncap_first}Mapper.toDto(entity.get${child+"s"}()));
        }
        </#list>
        </#if>

        <#if entity.relationships.parent??>
        ${entity.entityName?uncap_first}DTO.set${entity.relationships.parent.entity}(${entity.relationships.parent.entity?uncap_first}Mapper.toDto(entity.get${entity.relationships.parent.entity}()));
        </#if>

       <#if entity.relationships.referenceFrom??>
       <#list entity.relationships.referenceFrom as fromReference>
        ${entity.entityName?uncap_first}DTO.set${fromReference.from}(${fromReference.from?uncap_first}Mapper.toDto(entity.get${fromReference.from}()));
       </#list>
       </#if>
        </#if>
        return ${entity.entityName?uncap_first}DTO;
    }

    @Override
    public List<${entity.entityName}> toEntity(List<${entity.entityName}DTO> dtoList) {
        if ( dtoList == null ) {
            return null;
        }

        List<${entity.entityName}> list = new ArrayList<${entity.entityName}>( dtoList.size() );
        for ( ${entity.entityName}DTO ${entity.entityName?uncap_first}DTO : dtoList ) {
            list.add( toEntity( ${entity.entityName?uncap_first}DTO ) );
        }

        return list;
    }

    @Override
    public List<${entity.entityName}DTO> toDto(List<${entity.entityName}> entityList) {
        if ( entityList == null ) {
            return null;
        }

        List<${entity.entityName}DTO> list = new ArrayList<${entity.entityName}DTO>( entityList.size() );
        for ( ${entity.entityName} ${entity.entityName?uncap_first} : entityList ) {
            list.add( toDto( ${entity.entityName?uncap_first} ) );
        }

        return list;
    }

    @Override
    public ${entity.entityName} toEntity(${entity.entityName}DTO entityDTO) {
        if ( entityDTO == null ) {
            return null;
        }

        ${entity.entityName} ${entity.entityName?uncap_first} = new ${entity.entityName}();
        <#list entity.fields as field>
        ${entity.entityName?uncap_first}.set${field.fieldName}(entityDTO.get${field.fieldName}());
        </#list>
        <#if entity.relationships??>
        <#if entity.relationships.children??>
        <#list entity.relationships.children as child>
        if(CollectionUtils.isNotEmpty(entityDTO.get${child+"s"}())){
            ${entity.entityName?uncap_first}.set${child+"s"}(${child?uncap_first}Mapper.toEntity(entityDTO.get${child+"s"}()));
            ${entity.entityName?uncap_first}.get${child+"s"}().forEach(${child?uncap_first}->{
                ${child?uncap_first}.set${entity.entityName}(${entity.entityName?uncap_first});
            });
        }
        </#list>
        </#if>

        <#if entity.relationships.parent??>
        ${entity.entityName?uncap_first}.set${entity.relationships.parent.entity}(${entity.relationships.parent.entity?uncap_first}Mapper.toEntity(entityDTO.get${entity.relationships.parent.entity}()));
        </#if>

       <#if entity.relationships.referenceFrom??>
       <#list entity.relationships.referenceFrom as fromReference>
        ${entity.entityName?uncap_first}.set${fromReference.from}(${fromReference.from?uncap_first}Mapper.toEntity(entityDTO.get${fromReference.from}()));
       </#list>
       </#if>
       </#if>
        return ${entity.entityName?uncap_first};
    }
}