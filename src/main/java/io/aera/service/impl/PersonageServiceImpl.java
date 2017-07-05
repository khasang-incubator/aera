package io.aera.service.impl;

import io.aera.dao.PersonageDao;
import io.aera.entity.Personage;
import io.aera.service.PersonageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("personageService")
public class PersonageServiceImpl implements PersonageService {
    @Autowired
    private PersonageDao personageDao;

    @Override
    public Personage createPersonage(Personage personage) {
        return personageDao.create(personage);
    }

    @Override
    public Personage updatePersonage(Personage personage) {
        return personageDao.update(personage);
    }

    @Override
    public void deletePersonageById(long personId) {
        personageDao.deleteById(personId);
    }

    @Override
    public Personage getPersonageById(long personId) {
        return personageDao.getById(personId);
    }

    @Override
    public List<Personage> getPersonageList() {
        return personageDao.getList();
    }
}
