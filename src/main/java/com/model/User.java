package com.model;

public class User {
    private int userId;
    private String fullName;
    private String nic;
    private String address;
    private String phoneNumber;

    private String birthday;

    private int age;

    private String gender;

    public User(int userId, String fullName, String nic, String address, String phoneNumber, String birthday, int age, String gender) {
        this.userId = userId;
        this.fullName = fullName;
        this.nic = nic;
        this.address = address;
        this.phoneNumber = phoneNumber;

        this.birthday = birthday;
        this.age = age;
        this.gender = gender;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getNic() {
        return nic;
    }

    public void setNic(String nic) {
        this.nic = nic;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    //
    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }


    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }


}
