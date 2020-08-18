package com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.service.impl;

import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.specification.${entity.entityName}Specification;
import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.domain.${entity.entityName};
import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.repository.${entity.entityName}Repository;
import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.service.${entity.entityName}Service;
import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.dto.${entity.entityName}DTO;
import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.service.mapper.${entity.entityName}Mapper;
import com.welzuka.service.SearchCriterion;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.Date;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * Service Implementation for managing ${entity.entityName}.
 */
@Service
@Transactional
public class ${entity.entityName}ServiceImpl implements ${entity.entityName}Service {

    private final Logger log = LoggerFactory.getLogger(${entity.entityName}ServiceImpl.class);

    @Autowired
    EntityManager entityManager;

    @Autowired
    private ${entity.entityName}Repository ${entity.entityName?uncap_first}Repository;

    @Autowired
    private ${entity.entityName}Mapper ${entity.entityName?uncap_first}Mapper;

    /**
     * Save a ${entity.entityName?uncap_first}.
     *
     * @param ${entity.entityName?uncap_first}DTO the entity to save
     * @return the persisted entity
     */
    @Override
    public ${entity.entityName}DTO save(${entity.entityName}DTO ${entity.entityName?uncap_first}DTO) {
        log.debug("Request to save ${entity.entityName} : {}", ${entity.entityName?uncap_first}DTO);
        ${entity.entityName} ${entity.entityName?uncap_first} = ${entity.entityName?uncap_first}Mapper.toEntity(${entity.entityName?uncap_first}DTO);
        ${entity.entityName?uncap_first}Repository.save(${entity.entityName?uncap_first});
        entityManager.flush();
        entityManager.clear();
        ${entity.entityName} result = ${entity.entityName?uncap_first}Repository.findOne(${entity.entityName?uncap_first}.getId());
        return ${entity.entityName?uncap_first}Mapper.toDto(result);
    }

    /**
     * Get all the ${entity.entityName}.
     *
     * @return the list of entities
     */
    @Override
    @Transactional(readOnly = true)
    public Page<${entity.entityName}DTO> findAll(Pageable pageable) {
        log.debug("Request to get all ${entity.entityName}s");
        Iterable<${entity.entityName}> iterable = ${entity.entityName?uncap_first}Repository.findAll();
        List<${entity.entityName}> ${entity.entityName?uncap_first}s = new ArrayList<>();
        iterable.forEach(${entity.entityName?uncap_first}s::add);
        List<${entity.entityName}DTO> ${entity.entityName?uncap_first}DTOS = ${entity.entityName?uncap_first}Mapper.toDto(${entity.entityName?uncap_first}s);
        Page<${entity.entityName}DTO> ${entity.entityName?uncap_first}DTOPage = new PageImpl<>(${entity.entityName?uncap_first}DTOS);
        return ${entity.entityName?uncap_first}DTOPage;
    }

    /**
     * Get one ${entity.entityName} by id.
     *
     * @param id the id of the entity
     * @return the entity
     */
    @Override
    @Transactional(readOnly = true)
    public Optional<${entity.entityName}DTO> findOne(Long id) {
        log.debug("Request to get ${entity.entityName} : {}", id);
        Optional<${entity.entityName}DTO> ${entity.entityName?uncap_first}DTO = Optional.of(${entity.entityName?uncap_first}Mapper.toDto(${entity.entityName?uncap_first}Repository.findOne(id)));
        return ${entity.entityName?uncap_first}DTO;
    }

    /**
     * Delete the ${entity.entityName} by id.
     *
     * @param id the id of the entity
     */
    @Override
    public void delete(Long id) {
        log.debug("Request to delete ${entity.entityName} : {}", id);
        ${entity.entityName?uncap_first}Repository.delete(id);
    }

    /**
     * Search the ${entity.entityName}.
     *
     * @return the list of entities
     */
    @Override
    @Transactional(readOnly = true)
    public List<${entity.entityName}DTO> search(SearchCriterion criterion) {
        log.debug("Search  all Projects");
        ${entity.entityName}Specification ${entity.entityName?uncap_first}Specification = new ${entity.entityName}Specification(criterion);
        Iterable<${entity.entityName}> iterable = ${entity.entityName?uncap_first}Repository.findAll(${entity.entityName?uncap_first}Specification);
        List<${entity.entityName}> ${entity.entityName?uncap_first}s = new ArrayList<>();
        iterable.forEach(${entity.entityName?uncap_first}s::add);
        List<${entity.entityName}DTO> ${entity.entityName?uncap_first}DTOS = ${entity.entityName?uncap_first}Mapper.toDto(${entity.entityName?uncap_first}s);
        return ${entity.entityName?uncap_first}DTOS;
    }

}