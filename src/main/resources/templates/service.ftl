package com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.service;

import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.dto.${entity.entityName}DTO;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import java.util.Date;
import com.welzuka.service.SearchCriterion;

import java.util.Optional;
import java.util.List;

public interface ${entity.entityName}Service{

    /**
     * Save a ${entity.entityName?uncap_first}.
     *
     * @param ${entity.entityName?uncap_first}DTO the entity to save
     * @return the persisted entity
     */
    ${entity.entityName}DTO save(${entity.entityName}DTO ${entity.entityName?uncap_first}DTO);

    /**
     * Get all the ${entity.entityName?uncap_first}s.
     *
     * @param pageable the pagination information
     * @return the list of entities
     */
    Page<${entity.entityName}DTO> findAll(Pageable pageable);

    /**
     * Get the "id" ${entity.entityName?uncap_first}.
     *
     * @param id the id of the entity
     * @return the entity
     */
    Optional<${entity.entityName}DTO> findOne(Long id);

    /**
     * Delete the "id" ${entity.entityName?uncap_first}.
     *
     * @param id the id of the entity
     */
    void delete(Long id);

    List<${entity.entityName}DTO> search(SearchCriterion criterion);
}