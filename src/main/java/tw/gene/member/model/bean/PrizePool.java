package tw.gene.member.model.bean;

import org.springframework.stereotype.Component;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Component
@Table(name = "prizepool")
public class PrizePool {
	
	@Id
	@Column(name = "PRIZEPOOLID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int prizepoolID;
	
	@Column(name = "PRIZEINVENTORY")
	private int prizeInventory;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "FK_PRIZEID")
	private Prize prize;

	public int getPrizepoolID() {
		return prizepoolID;
	}

	public void setPrizepoolID(int prizepoolID) {
		this.prizepoolID = prizepoolID;
	}

	public Prize getPrize() {
		return prize;
	}

	public void setPrize(Prize prize) {
		this.prize = prize;
	}

	public int getPrizeInventory() {
		return prizeInventory;
	}

	public void setPrizeInventory(int prizeInventory) {
		this.prizeInventory = prizeInventory;
	}
	
	

}
