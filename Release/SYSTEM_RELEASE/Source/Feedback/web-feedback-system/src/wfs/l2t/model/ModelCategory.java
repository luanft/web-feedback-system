package wfs.l2t.model;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.ListIterator;

import wfs.l2t.dto.dtoCategory;

public class ModelCategory extends Model {

	public ModelCategory() {
		super();

	}

	
	public List<dtoCategory> getAllCategoryByUser(String userId)
	{
		String sql = "SELECT `category`.`CategoryId` , `Description` , COALESCE( `Care`.`CategoryId` , 0 ) AS `Checked` FROM `category` LEFT JOIN `care` ON `category`.`CategoryId` = `Care`.`CategoryId` AND `care`.`AccountId` = " + userId;
		List<dtoCategory> data = new ArrayList<dtoCategory>();
		if (this.connection.connect()) {
			ResultSet rs = this.connection.read(sql);
			if(rs != null)
			{
				try {
					while (rs.next()) {
						dtoCategory item = new dtoCategory();
						item.categoryId = rs.getString("CategoryId");
						item.categoryName = rs.getString("Description");
						item.checked =  rs.getInt("Checked") == 0 ? "" : "checked";
						data.add(item);
						
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			this.connection.close();
		}
		return data;
	}
	
	public List<dtoCategory> getAllCategory() {
		List<dtoCategory> data = new ArrayList<dtoCategory>();
		if (this.connection.connect()) {
			ResultSet rs = this.connection.read("SELECT * FROM `category`");
			if(rs != null)
			{
				try {
					while (rs.next()) {
						dtoCategory item = new dtoCategory();
						item.categoryId = rs.getString("CategoryId");
						item.categoryName = rs.getString("Description");
						data.add(item);
					}
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			this.connection.close();
		}
		return data;
	}

}
