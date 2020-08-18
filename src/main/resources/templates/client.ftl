package com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.client;

import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.dto.${entity.entityName}DTO;
import org.springframework.cloud.netflix.feign.FeignClient;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import com.welzuka.service.SearchCriterion;
import java.util.Date;
import org.springframework.web.bind.annotation.RequestMethod;

import java.awt.print.Pageable;
import java.lang.invoke.MethodType;
import java.util.List;

@FeignClient(name = "${componentName?upper_case}-APPLICATION")
public interface ${entity.entityName}Client {

    @RequestMapping(value = "/api/${entity.entityName?uncap_first}",method = RequestMethod.POST)
    public ResponseEntity<${entity.entityName}DTO> create${entity.entityName}(@RequestBody ${entity.entityName}DTO ${entity.entityName?uncap_first}DTO);

    @RequestMapping(value = "/api/${entity.entityName?uncap_first}",method = RequestMethod.PUT)
    public ResponseEntity<${entity.entityName}DTO> update${entity.entityName}(@RequestBody ${entity.entityName}DTO ${entity.entityName?uncap_first}DTO);

    @RequestMapping(value = "/api/${entity.entityName?uncap_first}",method = RequestMethod.GET)
    public ResponseEntity<List<${entity.entityName}DTO>> getAll${entity.entityName}s(Pageable pageable);

    @RequestMapping(value = "/api/${entity.entityName?uncap_first}/search",method = RequestMethod.POST)
    public ResponseEntity<List<${entity.entityName}DTO>> getAll${entity.entityName}s(@RequestBody SearchCriterion criterion);

    @RequestMapping(value = "/api/${entity.entityName?uncap_first}/{id}",method = RequestMethod.GET)
    public ResponseEntity<${entity.entityName}DTO> get${entity.entityName}(@PathVariable(value = "id") Long id);

    @RequestMapping(value = "/api/${entity.entityName?uncap_first}/{id}",method = RequestMethod.DELETE)
    public ResponseEntity<Void> delete${entity.entityName}(@PathVariable(value="id") Long id);

}
