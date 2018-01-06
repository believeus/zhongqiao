package cn.believeus.model;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;


@Table(name="zqdata")
@Entity
public class Zqdata extends TbaseEntity implements java.io.Serializable {

	// Fields

	/**
	 * 
	 */
	private static final long serialVersionUID = -3416419788711416943L;


	@ManyToOne
	@JoinColumn(name="fk_metaId")
	private Zqmeta zqmeta;

	private String title;
	private String content;
	
	// Constructors

	/** default constructor */
	public Zqdata() {
	}

	/** full constructor */
	public Zqdata(Zqmeta zqmeta, String title, String content) {
		this.zqmeta = zqmeta;
		this.title = title;
		this.content = content;
		
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Zqmeta getZqmeta() {
		return this.zqmeta;
	}

	public void setZqmeta(Zqmeta zqmeta) {
		this.zqmeta = zqmeta;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}


}