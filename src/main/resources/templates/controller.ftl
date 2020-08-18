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
     * POST  /${entity.entityName?uncap_first} : Create a new ${entity.entityName?uncap_first}.
     *
     * @param ${entity.entityName?uncap_first}DTO the ${entity.entityName?uncap_first}DTO to create
     * @return the ResponseEntity with status 201 (Created) and with body the new ${entity.entityName?uncap_first}DTO, or with status 400 (Bad Request) if the ${entity.entityName?uncap_first} has already an ID
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @PostMapping("/${entity.entityName?uncap_first}")
    public ResponseEntity<${entity.entityName}DTO> create${entity.entityName}(@Valid @RequestBody ${entity.entityName}DTO ${entity.entityName?uncap_first}DTO) throws URISyntaxException {
        log.debug("REST request to save ${entity.entityName} : {}", ${entity.entityName?uncap_first}DTO);
        if (${entity.entityName?uncap_first}DTO.getId() != null) {
            throw new BadRequestAlertException("A new ${entity.entityName?uncap_first} cannot already have an ID", ENTITY_NAME, "idexists");
        }
        ${entity.entityName}DTO result = ${entity.entityName?uncap_first}Service.save(${entity.entityName?uncap_first}DTO);
        return ResponseEntity.created(new URI("/api/${entity.entityName?uncap_first}/" + result.getId()))
            .headers(HeaderUtil.createEntityCreationAlert(ENTITY_NAME, result.getId().toString()))
            .body(result);
    }

    /**
     * PUT  /${entity.entityName?uncap_first} : Updates an existing ${entity.entityName?uncap_first}.
     *
     * @param ${entity.entityName?uncap_first}DTO the ${entity.entityName?uncap_first}DTO to update
     * @return the ResponseEntity with status 200 (OK) and with body the updated ${entity.entityName?uncap_first}DTO,
     * or with status 400 (Bad Request) if the ${entity.entityName?uncap_first}DTO is not valid,
     * or with status 500 (Internal Server Error) if the ${entity.entityName?uncap_first}DTO couldn't be updated
     * @throws URISyntaxException if the Location URI syntax is incorrect
     */
    @PutMapping("/${entity.entityName?uncap_first}")
    public ResponseEntity<${entity.entityName}DTO> update${entity.entityName}(@Valid @RequestBody ${entity.entityName}DTO ${entity.entityName?uncap_first}DTO) throws URISyntaxException {
        log.debug("REST request to update ${entity.entityName} : {}", ${entity.entityName?uncap_first}DTO);
        if (${entity.entityName?uncap_first}DTO.getId() == null) {
            throw new BadRequestAlertException("Invalid id", ENTITY_NAME, "idnull");
        }
        ${entity.entityName}DTO result = ${entity.entityName?uncap_first}Service.save(${entity.entityName?uncap_first}DTO);
        return ResponseEntity.ok()
            .headers(HeaderUtil.createEntityUpdateAlert(ENTITY_NAME, ${entity.entityName?uncap_first}DTO.getId().toString()))
            .body(result);
    }

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
     * GET  /${entity.entityName?uncap_first} : get all the ${entity.entityName?uncap_first} by search.
     *
     * @param criterion the search information
     * @return the ResponseEntity with status 200 (OK) and the list of ${entity.entityName?uncap_first} in body
     */
    @PostMapping("/${entity.entityName?uncap_first}/search")
    public ResponseEntity<List<${entity.entityName}DTO>> getAll${entity.entityName}s(@Valid @RequestBody SearchCriterion criterion) {
        log.debug("REST request to get a page of ${entity.entityName}s");
        List<${entity.entityName}DTO> ${entity.entityName?uncap_first}DTOS = ${entity.entityName?uncap_first}Service.search(criterion);
        Page<${entity.entityName}DTO> page = new PageImpl<${entity.entityName}DTO>(${entity.entityName?uncap_first}DTOS);
        HttpHeaders headers = PaginationUtil.generatePaginationHttpHeaders(page, "/api/${entity.entityName?uncap_first}/search");
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

    /**
     * DELETE  /${entity.entityName?uncap_first}/:id : delete the "id" ${entity.entityName?uncap_first}.
     *
     * @param id the id of the ${entity.entityName?uncap_first}DTO to delete
     * @return the ResponseEntity with status 200 (OK)
     */
    @DeleteMapping("/${entity.entityName?uncap_first}/{id}")
    public ResponseEntity<Void> delete${entity.entityName}(@PathVariable Long id) {
        log.debug("REST request to delete ${entity.entityName} : {}", id);
        ${entity.entityName?uncap_first}Service.delete(id);
        return ResponseEntity.ok().headers(HeaderUtil.createEntityDeletionAlert(ENTITY_NAME, id.toString())).build();
    }
}
