package com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.rest;

import com.welzuka.rest.errors.BadRequestAlertException;
import com.welzuka.rest.util.HeaderUtil;
import com.welzuka.rest.util.PaginationUtil;
import com.welzuka.rest.util.ResponseUtil;
import com.welzuka.service.SearchCriterion;
import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.service.${entity.entityName}Service;
import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.dto.${entity.entityName}DTO;
import org.slf4j.Logger;
import java.util.Date;
import org.slf4j.LoggerFactory;
import org.springframework.data.domain.PageImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.net.URI;
import java.net.URISyntaxException;
import java.util.List;
import java.util.Optional;

/**
 * REST controller for managing ${entity.entityName}.
 */
@RestController
@RequestMapping("/api")
public class ${entity.entityName}Controller {

    private final Logger log = LoggerFactory.getLogger(${entity.entityName}Controller.class);

    private static final String ENTITY_NAME = "${entity.entityName?uncap_first}";

    @Autowired
    private  ${entity.entityName}Service ${entity.entityName?uncap_first}Service;


    /**
     * GET  /${entity.entityName?uncap_first} : get all the ${entity.entityName?uncap_first}.
     *
     * @param pageable the pagination information
     * @return the ResponseEntity with status 200 (OK) and the list of ${entity.entityName?uncap_first} in body
     */
    @GetMapping("/${entity.entityName?uncap_first}")
    public ResponseEntity<List<${entity.entityName}DTO>> getAll${entity.entityName}s(Pageable pageable) {
        log.debug("REST request to get a page of ${entity.entityName}s");
        Page<${entity.entityName}DTO> page = ${entity.entityName?uncap_first}Service.findAll(pageable);
        HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(page, "/api/${entity.entityName?uncap_first}");
        return ResponseEntity.ok().headers(headers).body(page.getContent());
    }

    /**
     * GET  /${entity.entityName?uncap_first}/:id : get the "id" ${entity.entityName?uncap_first}.
     *
     * @param id the id of the doctorAccountDTO to retrieve
     * @return the ResponseEntity with status 200 (OK) and with body the doctorAccountDTO, or with status 404 (Not Found)
     */
    @GetMapping("/${entity.entityName?uncap_first}/{id}")
    public ResponseEntity<${entity.entityName}DTO> get${entity.entityName}(@PathVariable Long id) {
        log.debug("REST request to get ${entity.entityName} : {}", id);
        Optional<${entity.entityName}DTO> ${entity.entityName?uncap_first}DTO = ${entity.entityName?uncap_first}Service.findOne(id);
        return ResponseUtil.wrapOrNotFound(${entity.entityName?uncap_first}DTO);
    }

}
