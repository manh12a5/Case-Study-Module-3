package service;

import java.util.List;

public interface IService<E> {

    List<E> findAll();

    E findById(int id);

    void insert(E e);

    void delete(int id);

}
