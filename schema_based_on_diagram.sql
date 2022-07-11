CREATE TABLE patients(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    name VARCHAR(100),
    date_of_birth DATE
);
CREATE TABLE medical_histories(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    admitted_at TIMESTAMP,
    patient_id INT,
    status VARCHAR(100),
    CONSTRAINT fk_patient FOREIGN KEY(patient_id) REFERENCES patients(id)
);
CREATE TABLE invoices(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    total_amount DECIMAL,
    generated_at TIMESTAMP,
    payed_at TIMESTAMP,
    medical_history_id INT,
    CONSTRAINT fk_medical_histories FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id)
);
CREATE TABLE invoice_items(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    unit_price DECIMAL,
    quantity INT,
    total_price DECIMAL,
    invoice_id INT,
    treatment_id INT,
    CONSTRAINT fk_medical_histories FOREIGN KEY(invoice_id) REFERENCES invoices(id),
    CONSTRAINT fk_medical_histories FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);
CREATE TABLE treatments(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    type VARCHAR(100),
    name VARCHAR(100)
);
CREATE TABLE treatments_histories(
    id INT GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
    treatment_id INT,
    medical_history_id INT,
    CONSTRAINT fk_medical_histories FOREIGN KEY(medical_history_id) REFERENCES medical_histories(id),
    CONSTRAINT fk_medical_histories FOREIGN KEY(treatment_id) REFERENCES treatments(id)
);
CREATE INDEX patients_id_idx ON patients(id);
CREATE INDEX patients_name ON patients(name);
CREATE INDEX medical_histories_id_idx ON medical_histories(id);
CREATE INDEX treatments_id_idx ON treatments(id);
CREATE INDEX invoices_id_idx ON invoices(id);
CREATE INDEX invoice_items_id_idx ON invoice_items(id);
CREATE INDEX link_medical_histories_treatments_medical_history_id_idx ON link_medical_histories_treatments (medical_history_id);
CREATE INDEX link_medical_histories_treatments_treatment_id_idx ON link_medical_histories_treatments (treatment_id);