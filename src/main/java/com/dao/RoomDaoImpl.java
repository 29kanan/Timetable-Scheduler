package com.dao;

import java.sql.*;
import java.util.*;

import com.model.Room;
import com.util.DBConnection;

public class RoomDaoImpl implements RoomDao {

	
	public boolean addRoom(Room r) {
        boolean status = false;
        String sql = "INSERT INTO rooms(room_name, room_num) VALUES (?, ?)";

        try( Connection con = DBConnection.getConnection();
                PreparedStatement ps = con.prepareStatement(sql);
                ) {
           ps.setString(1, r.getRoom_name());
            ps.setInt(2, r.getRoom_num());

            status = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public List<Room> getAllRooms() {
        List<Room> list = new ArrayList<>();
        try( Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM rooms");
            ResultSet rs = ps.executeQuery();
           ) {
            while (rs.next()) {
                Room r = new Room();
                r.setRoom_id(rs.getInt("room_id"));
                r.setRoom_name(rs.getString("room_name"));
                r.setRoom_num(rs.getInt("room_num"));
                list.add(r);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    public Room getRoomById(int id) {
        Room r = null;
        try(Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("SELECT * FROM rooms WHERE room_id=?");
           ) {
             ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                r = new Room();
                r.setRoom_id(rs.getInt("room_id"));
                r.setRoom_name(rs.getString("room_name"));
                r.setRoom_num(rs.getInt("room_num"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return r;
    }

    public boolean updateRoom(Room r) {
        boolean status = false;
        try( Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("UPDATE rooms SET room_name=?, room_num=? WHERE room_id=?");
            ) {
            ps.setString(1, r.getRoom_name());
            ps.setInt(2, r.getRoom_num());
            ps.setInt(3, r.getRoom_id());

            status = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public boolean deleteRoom(int id) {
        boolean status = false;
        try( Connection con = DBConnection.getConnection();
            PreparedStatement ps = con.prepareStatement("DELETE FROM rooms WHERE room_id=?");
            ) {
           ps.setInt(1, id);
            status = ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
	
	
}
