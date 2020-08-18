package com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.service.impl;

import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.service.${entity.entityName}Service;
import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.dto.${entity.entityName}DTO;
import com.welzuka.service.SearchCriterion;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import java.util.Date;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageImpl;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

/**
 * Service Implementation for managing ${entity.entityName}.
 */
@Service
public class ${entity.entityName}ServiceImpl implements ${entity.entityName}Service {

    private final Logger log = LoggerFactory.getLogger(${entity.entityName}ServiceImpl.class);


    /**
     * Get all the ${entity.entityName}.
     *
     * @return the list of entities
     */
    @Override
    public Page<${entity.entityName}DTO> findAll(Pageable pageable) {
        log.debug("Request to get all ${entity.entityName}s");
        return null;
    }

    /**
     * Get one ${entity.entityName} by id.
     *
     * @param id the id of the entity
     * @return the entity
     */
    @Override
    public Optional<${entity.entityName}DTO> findOne(Long id) {
        log.debug("Request to get ${entity.entityName} : {}", id);
        return null;
    }

}