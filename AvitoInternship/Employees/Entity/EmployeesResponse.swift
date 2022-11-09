//
//  EmployeesResponse.swift
//  AvitoInternship
//
//  Created by urichese on 06.11.2022.
//

import Foundation

struct EmployeesResponse: Decodable {
	var company: Company
}

struct Company: Decodable {
	let name: String
	var employees: [Employee]
}

struct Employee: Decodable {
	let name: String
	let phoneNumber: String
	let skills: [String]
}
