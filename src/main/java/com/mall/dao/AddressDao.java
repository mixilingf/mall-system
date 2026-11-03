package com.mall.dao;

import com.mall.entity.Address;

import java.util.ArrayList;
import java.util.List;

public class AddressDao {
    private static List<Address> addresses = new ArrayList<Address>();
    private static int nextId = 1;

    public List<Address> findByUsername(String username) {
        List<Address> result = new ArrayList<Address>();
        for (Address a : addresses) {
            if (a.getUsername().equals(username)) {
                result.add(a);
            }
        }
        return result;
    }

    public Address findById(int id) {
        for (Address a : addresses) {
            if (a.getId() == id) {
                return a;
            }
        }
        return null;
    }

    public void add(Address address) {
        address.setId(nextId++);
        addresses.add(address);
    }

    public void update(Address address) {
        for (int i = 0; i < addresses.size(); i++) {
            if (addresses.get(i).getId() == address.getId()) {
                addresses.set(i, address);
                return;
            }
        }
    }

    public void delete(int id) {
        for (int i = 0; i < addresses.size(); i++) {
            if (addresses.get(i).getId() == id) {
                addresses.remove(i);
                return;
            }
        }
    }

    public void setDefault(String username, int id) {
        for (Address a : addresses) {
            if (a.getUsername().equals(username)) {
                a.setIsDefault(a.getId() == id);
            }
        }
    }
}
