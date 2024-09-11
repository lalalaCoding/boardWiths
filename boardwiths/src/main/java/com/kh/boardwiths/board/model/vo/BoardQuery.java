package com.kh.boardwiths.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
@ToString
public class BoardQuery {
	private int queryNo;
	private String queryReason;
	private int refBoardNo;
	private String otherReason;
}
