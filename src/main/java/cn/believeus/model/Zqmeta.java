package cn.believeus.model;

import javax.persistence.*;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

/**
 * Zqmeta entity. @author MyEclipse Persistence Tools
 */

@Table(name="zqmeta")
@Entity
public class Zqmeta {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer id;
	private String name;
	private Integer parentId;
	private String imageUrl;
	//private Set zqdatas = new HashSet(0);

	@OneToMany(mappedBy = "zqmeta")
	private List<Zqdata> zqdatas;

	@Transient
	private List<Zqmeta> children;

	// Constructors

	/** default constructor */
	public Zqmeta() {
	}

	public Zqmeta(Integer id) {
		this.id = id;
	}

	/** full constructor */
	public Zqmeta(String name, Integer parentId, String imageUrl) {
		this.name = name;
		this.parentId = parentId;
		this.imageUrl = imageUrl;
//		this.zqdatas = zqdatas;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getParentId() {
		return this.parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getImageUrl() {
		return this.imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

//	public Set getZqdatas() {
//		return this.zqdatas;
//	}

//	public void setZqdatas(Set zqdatas) {
//		this.zqdatas = zqdatas;
//	}


	public List<Zqdata> getZqdatas() {
		return zqdatas;
	}

	public void setZqdatas(List<Zqdata> zqdatas) {
		this.zqdatas = zqdatas;
	}

	public List<Zqmeta> getChildren() {
		return children;
	}

	public void setChildren(List<Zqmeta> children) {
		this.children = children;
	}
}