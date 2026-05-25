CREATE TABLE "AU_tab"(
    "ProcTipo" NVARCHAR(3) NOT NULL,
    "Processo" NCHAR(255) NOT NULL,
    "Numero" INT NOT NULL,
    "Ano" INT NOT NULL,
    "Referências" VARCHAR(255) NOT NULL,
    "Entrada" DATE NOT NULL,
    "Local_obra" NCHAR(255) NOT NULL,
    "Freguesia" CHAR(255) NOT NULL,
    "Interessado" NCHAR(255) NOT NULL,
    "Resid_Interessado" NCHAR(255) NOT NULL,
    "Reclamado" NCHAR(255) NOT NULL,
    "Resid_Reclamado" NCHAR(255) NOT NULL,
    "Gestor" INT NOT NULL,
    "Admin" INT NOT NULL,
    "Etapa" NCHAR(255) NOT NULL,
    "Situação" NCHAR(255) NOT NULL,
    "Local_Proc" NCHAR(255) NOT NULL,
    "Prazo" DATE NOT NULL,
    "SitEmbargo" NCHAR(255) NOT NULL,
    "TipoEmbargo" NCHAR(255) NOT NULL,
    "Data" DATE NOT NULL,
    "PrazoEmb" DATE NOT NULL,
    "Expira" DATE NOT NULL,
    "Obs" VARCHAR(255) NOT NULL,
    "RegistadoPor" NCHAR(255) NOT NULL,
    "AlteradoPor" NCHAR(255) NOT NULL,
    "Prioridade" INT NOT NULL
);
CREATE TABLE "EmbargoHist"(
    "EmbH" BIGINT NOT NULL,
    "ProcessoLnk" NCHAR(255) NOT NULL,
    "Decisão" VARCHAR(255) NOT NULL,
    "Tipo" VARCHAR(255) NOT NULL,
    "Data" DATE NOT NULL,
    "Prazo" INT NOT NULL,
    "Expira" DATE NOT NULL
);
ALTER TABLE
    "EmbargoHist" ADD CONSTRAINT "embargohist_embh_primary" PRIMARY KEY("EmbH");
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'Número Automático', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'EmbargoHist', @level2type = N'COLUMN', @level2name = N'EmbH';
CREATE TABLE "Historico"(
    "H_id" BIGINT NOT NULL,
    "ProcessoLnk" NCHAR(255) NOT NULL,
    "ProcTipo" NVARCHAR(3) NOT NULL,
    "Data_mov" DATETIME NOT NULL,
    "Etapa" NCHAR(255) NOT NULL,
    "Situação" NCHAR(255) NOT NULL,
    "Gestor" INT NOT NULL,
    "Setor" NCHAR(255) NOT NULL,
    "RegistadoPor" NCHAR(255) NOT NULL,
    "AlteradoPor" NCHAR(255) NOT NULL,
    "Obs" NVARCHAR(255) NOT NULL,
    "Timestamp" DATETIME NOT NULL
);
ALTER TABLE
    "Historico" ADD CONSTRAINT "historico_h_id_primary" PRIMARY KEY("H_id");
CREATE TABLE "OBS_TAB"(
    "Obsid" BIGINT NOT NULL,
    "Ref_ID" VARCHAR(255) NOT NULL,
    "Data" DATE NOT NULL,
    "Nota" NVARCHAR(255) NOT NULL,
    "Timestamp" DATETIME NOT NULL,
    "ProcessoLnk" NCHAR(255) NOT NULL
);
ALTER TABLE
    "OBS_TAB" ADD CONSTRAINT "obs_tab_obsid_primary" PRIMARY KEY("Obsid");
CREATE TABLE "Freguesias"(
    "id" INT NOT NULL,
    "Freguesia" CHAR(255) NOT NULL
);
ALTER TABLE
    "Freguesias" ADD CONSTRAINT "freguesias_id_primary" PRIMARY KEY("id");
CREATE TABLE "Etapas"(
    "Et_id" INT NOT NULL,
    "ProcTipo" BIGINT NOT NULL,
    "Etapa" BIGINT NOT NULL,
    "Situação" BIGINT NOT NULL
);
ALTER TABLE
    "Etapas" ADD CONSTRAINT "etapas_et_id_primary" PRIMARY KEY("Et_id");
CREATE TABLE "Funcionario"(
    "fun_id" INT NOT NULL,
    "Nome_completo" NCHAR(255) NOT NULL,
    "Nome" NCHAR(255) NOT NULL,
    "Categoria" NCHAR(255) NOT NULL,
    "Grau" BIGINT NOT NULL,
    "Unidade" NCHAR(255) NOT NULL,
    "Equipa" NCHAR(255) NOT NULL,
    "id_int_fun" BIGINT NOT NULL
);
ALTER TABLE
    "Funcionario" ADD CONSTRAINT "funcionario_fun_id_primary" PRIMARY KEY("fun_id");
CREATE TABLE "embargoTipo"(
    "bigintTipo_Embar" INT NOT NULL,
    "TipoEmb" BIGINT NOT NULL
);
ALTER TABLE
    "embargoTipo" ADD CONSTRAINT "embargotipo_biginttipo_embar_primary" PRIMARY KEY("bigintTipo_Embar");
ALTER TABLE
    "EmbargoHist" ADD CONSTRAINT "embargohist_processolnk_foreign" FOREIGN KEY("ProcessoLnk") REFERENCES "AU_tab"("Processo");
ALTER TABLE
    "Funcionario" ADD CONSTRAINT "funcionario_id_int_fun_foreign" FOREIGN KEY("id_int_fun") REFERENCES "AU_tab"("Gestor");
ALTER TABLE
    "OBS_TAB" ADD CONSTRAINT "obs_tab_processolnk_foreign" FOREIGN KEY("ProcessoLnk") REFERENCES "AU_tab"("Processo");
ALTER TABLE
    "Historico" ADD CONSTRAINT "historico_processolnk_foreign" FOREIGN KEY("ProcessoLnk") REFERENCES "AU_tab"("Processo");
ALTER TABLE
    "AU_tab" ADD CONSTRAINT "au_tab_proctipo_foreign" FOREIGN KEY("ProcTipo") REFERENCES "Etapas"("ProcTipo");
ALTER TABLE
    "AU_tab" ADD CONSTRAINT "au_tab_freguesia_foreign" FOREIGN KEY("Freguesia") REFERENCES "Freguesias"("Freguesia");
ALTER TABLE
    "EmbargoHist" ADD CONSTRAINT "embargohist_tipo_foreign" FOREIGN KEY("Tipo") REFERENCES "embargoTipo"("TipoEmb");
