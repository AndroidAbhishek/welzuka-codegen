package com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.repository;

import com.${projectName?lower_case}.${componentName?lower_case}.${componentName?lower_case}.domain.${entity.entityName};
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.stereotype.Repository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

@Repository
public interface ${entity.entityName}Repository extends PagingAndSortingRepository<${entity.entityName}, Long> , JpaSpecificationExecutor<${entity.entityName}>{
}