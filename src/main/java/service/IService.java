package service;

import java.util.List;

public interface IService<E> {

    List<E> findAll();

    E findById(int id);

    void insert(E e);

    void delete(int id);

    void edit(E e);

    List<E> findByName(String name);
}
