package com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.service.mapper;

import com.welzuka.service.mapper.EntityMapper;
import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.domain.${entity.entityName};
import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.dto.${entity.entityName}DTO;
import org.mapstruct.Mapper;
import org.mapstruct.Mapping;
import java.util.Date;

/**
 * Mapper for the entity ${entity.entityName} and its DTO ${entity.entityName}DTO.
 */
@Mapper(componentModel = "spring", uses = {})
public interface ${entity.entityName}Mapper extends EntityMapper<${entity.entityName}DTO, ${entity.entityName}> {


    @Mapping(target = "${entity.entityName?uncap_first}s", ignore = true)
    ${entity.entityName} toEntity(${entity.entityName}DTO ${entity.entityName?uncap_first}DTO);

    default ${entity.entityName} fromId(Long id) {
        if (id == null) {
            return null;
        }
        ${entity.entityName} ${entity.entityName?uncap_first} = new ${entity.entityName}();
        ${entity.entityName?uncap_first}.setId(id);
        return ${entity.entityName?uncap_first};
    }
}