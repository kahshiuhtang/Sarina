package com.krtopi.backend.post;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface MissionPostRepository extends MongoRepository<MissionPostEntity, String> {
}
