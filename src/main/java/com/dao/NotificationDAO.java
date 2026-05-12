package com.dao;


import java.util.List;
import com.model.Notification;


public interface NotificationDAO {

    // Insert Notification
    public boolean addNotification(Notification n);
    public List<Notification> getAllNotification();
    public boolean deleteNotification(int id);
    // Get Notifications by Role
    public List<Notification> getNotificationsByRole(String role);
}