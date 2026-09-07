CREATE TABLE "processo"(
    "id" BIGINT NOT NULL,
    "proc_num" INT NOT NULL,
    "proc_ano" INT NOT NULL,
    "proc_id" NCHAR(255) NOT NULL
);
ALTER TABLE
    "processo" ADD CONSTRAINT "processo_id_primary" PRIMARY KEY("id");
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'CONCAT(proc_tipo,-,proc_num,/, proc_ano', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'processo', @level2type = N'COLUMN', @level2name = N'proc_id';
CREATE TABLE "Loc_obra"(
    "id" BIGINT NOT NULL,
    "proc_id" NCHAR(255) NOT NULL,
    "obra_arruamento" VARCHAR(255) NOT NULL,
    "obra_num" INT NOT NULL,
    "obra_andar" VARCHAR(255) NULL,
    "obra_cod-postal" VARCHAR(255) NOT NULL,
    "obra_localidade" VARCHAR(255) NOT NULL,
    "obra_desc_CRP" INT NOT NULL,
    "obra_art_matriz" INT NOT NULL,
    "loc_obra" VARCHAR(255) NOT NULL,
    "freg_obra" INT NOT NULL
);
ALTER TABLE
    "Loc_obra" ADD CONSTRAINT "loc_obra_id_primary" PRIMARY KEY("id");
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'ref- freguesia', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'Loc_obra', @level2type = N'COLUMN', @level2name = N'obra_localidade';
CREATE TABLE "interessado"(
    "id" BIGINT NOT NULL,
    "proc_id" NCHAR(255) NOT NULL,
    "tipo_interv" INT NOT NULL,
    "int_nome" NCHAR(255) NOT NULL,
    "int_n_meio" NCHAR(255) NOT NULL,
    "int_apelido" NCHAR(255) NOT NULL,
    "int_nif" INT NOT NULL,
    "int_arruamento" NCHAR(255) NOT NULL,
    "int_numero" INT NOT NULL,
    "int_andar" VARCHAR(255) NULL,
    "int_localidade" VARCHAR(255) NOT NULL,
    "int_cod-postal" VARCHAR(255) NOT NULL,
    "int_email" NVARCHAR(255) NOT NULL
);
ALTER TABLE
    "interessado" ADD CONSTRAINT "interessado_id_primary" PRIMARY KEY("id");
CREATE TABLE "tipo_interveniente"(
    "id" INT NOT NULL,
    "tipo_interv" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "tipo_interveniente" ADD CONSTRAINT "tipo_interveniente_id_primary" PRIMARY KEY("id");
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'tipificação de intervenção no processo (ex.: titular, mandatário, executante, etc)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'tipo_interveniente', @level2type = N'COLUMN', @level2name = N'tipo_interv';
CREATE TABLE "freguesia"(
    "id" INT NOT NULL,
    "freguesia" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "freguesia" ADD CONSTRAINT "freguesia_id_primary" PRIMARY KEY("id");
CREATE TABLE "interessado_hist"(
    "id" INT NOT NULL,
    "data" DATE NOT NULL,
    "int_ID" NVARCHAR(255) NOT NULL,
    "tipo_interv" VARCHAR(255) NOT NULL,
    "proc_id" NCHAR(255) NOT NULL
);
ALTER TABLE
    "interessado_hist" ADD CONSTRAINT "interessado_hist_id_primary" PRIMARY KEY("id");
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'concat from interessado int_nome int_n_meio int_apelido', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'interessado_hist', @level2type = N'COLUMN', @level2name = N'int_ID';
CREATE TABLE "embargo_hist"(
    "id" BIGINT NOT NULL,
    "proc_id" BIGINT NOT NULL,
    "emb_inicial" DATE NOT NULL,
    "emb_prazo" INT NOT NULL,
    "emb_expira" DATE NOT NULL,
    "emb_prorrogacao" DATE NOT NULL,
    "emb_tipo" BIGINT NOT NULL,
    "emb_estado" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "embargo_hist" ADD CONSTRAINT "embargo_hist_id_primary" PRIMARY KEY("id");
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'=emb_inicial+prazo(-15)', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'embargo_hist', @level2type = N'COLUMN', @level2name = N'emb_expira';
CREATE TABLE "tipo_emb"(
    "id" BIGINT NOT NULL,
    "emb_tipo" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "tipo_emb" ADD CONSTRAINT "tipo_emb_id_primary" PRIMARY KEY("id");
CREATE TABLE "prazo"(
    "id" BIGINT NOT NULL,
    "tipo" BIGINT NOT NULL
);
ALTER TABLE
    "prazo" ADD CONSTRAINT "prazo_id_primary" PRIMARY KEY("id");
CREATE TABLE "prazo_hist"(
    "id" BIGINT NOT NULL,
    "proc_id" NCHAR(255) NOT NULL,
    "prazo_tipo" INT NOT NULL,
    "prazod_not" DATE NOT NULL,
    "d_uteis" INT NULL,
    "dias" INT NULL,
    "prazo_expira" DATE NOT NULL,
    "prazo_sus" BIT NOT NULL
);
ALTER TABLE
    "prazo_hist" ADD CONSTRAINT "prazo_hist_id_primary" PRIMARY KEY("id");
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'num dias uteis atribuidos', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prazo_hist', @level2type = N'COLUMN', @level2name = N'd_uteis';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'num dias seguidos atribuidos', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prazo_hist', @level2type = N'COLUMN', @level2name = N'dias';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'=prazod_not+d_uteis+dias', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prazo_hist', @level2type = N'COLUMN', @level2name = N'prazo_expira';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'interruptor de contagem', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'prazo_hist', @level2type = N'COLUMN', @level2name = N'prazo_sus';
CREATE TABLE "fase_hist"(
    "id" BIGINT NOT NULL,
    "proc_id" NCHAR(255) NOT NULL,
    "dataMov" DATE NOT NULL,
    "fase" VARCHAR(255) NOT NULL,
    "etapa" VARCHAR(255) NOT NULL,
    "registadoPor" NVARCHAR(255) NOT NULL,
    "alteradoPor" NVARCHAR(255) NOT NULL,
    "obs" BIGINT NOT NULL,
    "TS" DATETIME NOT NULL,
    "proc_tipo" NCHAR(255) NOT NULL
);
ALTER TABLE
    "fase_hist" ADD CONSTRAINT "fase_hist_id_primary" PRIMARY KEY("id");
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'1º Registo na base de dados', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fase_hist', @level2type = N'COLUMN', @level2name = N'registadoPor';
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'modificações subsequentes', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'fase_hist', @level2type = N'COLUMN', @level2name = N'alteradoPor';
CREATE TABLE "fase"(
    "id" BIGINT NOT NULL,
    "fase" VARCHAR(255) NOT NULL,
    "etapa" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "fase" ADD CONSTRAINT "fase_id_primary" PRIMARY KEY("id");
CREATE TABLE "proc_info"(
    "id" BIGINT NOT NULL,
    "proc_id" NCHAR(255) NOT NULL,
    "proc_desc" BIGINT NOT NULL,
    "embargo" BIT NOT NULL,
    "titular" BIGINT NOT NULL,
    "emb_estado" BIGINT NOT NULL,
    "fase" VARCHAR(255) NOT NULL,
    "etapa" VARCHAR(255) NOT NULL,
    "legis" NCHAR(255) NOT NULL
);
ALTER TABLE
    "proc_info" ADD CONSTRAINT "proc_info_id_primary" PRIMARY KEY("id");
CREATE TABLE "localizacao_processo"(
    "id" BIGINT NOT NULL,
    "proc_id" NCHAR(255) NOT NULL,
    "data" DATE NOT NULL,
    "localização" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "localizacao_processo" ADD CONSTRAINT "localizacao_processo_id_primary" PRIMARY KEY("id");
CREATE TABLE "legislacao"(
    "id" BIGINT NOT NULL,
    "legis" NCHAR(255) NOT NULL
);
ALTER TABLE
    "legislacao" ADD CONSTRAINT "legislacao_id_primary" PRIMARY KEY("id");
EXEC sp_addextendedproperty @name = N'MS_Description', @value = N'legislação infrigida', @level0type = N'SCHEMA', @level0name = N'dbo', @level1type = N'TABLE', @level1name = N'legislacao', @level2type = N'COLUMN', @level2name = N'legis';
ALTER TABLE
    "fase_hist" ADD CONSTRAINT "fase_hist_proc_id_foreign" FOREIGN KEY("proc_id") REFERENCES "processo"("proc_id");
ALTER TABLE
    "interessado_hist" ADD CONSTRAINT "interessado_hist_tipo_interv_foreign" FOREIGN KEY("tipo_interv") REFERENCES "tipo_interveniente"("tipo_interv");
ALTER TABLE
    "fase_hist" ADD CONSTRAINT "fase_hist_etapa_foreign" FOREIGN KEY("etapa") REFERENCES "fase"("etapa");
ALTER TABLE
    "freguesia" ADD CONSTRAINT "freguesia_freguesia_foreign" FOREIGN KEY("freguesia") REFERENCES "Loc_obra"("freg_obra");
ALTER TABLE
    "proc_info" ADD CONSTRAINT "proc_info_etapa_foreign" FOREIGN KEY("etapa") REFERENCES "fase"("etapa");
ALTER TABLE
    "localizacao_processo" ADD CONSTRAINT "localizacao_processo_proc_id_foreign" FOREIGN KEY("proc_id") REFERENCES "processo"("proc_id");
ALTER TABLE
    "tipo_emb" ADD CONSTRAINT "tipo_emb_emb_tipo_foreign" FOREIGN KEY("emb_tipo") REFERENCES "embargo_hist"("emb_tipo");
ALTER TABLE
    "legislacao" ADD CONSTRAINT "legislacao_legis_foreign" FOREIGN KEY("legis") REFERENCES "proc_info"("legis");
ALTER TABLE
    "proc_info" ADD CONSTRAINT "proc_info_fase_foreign" FOREIGN KEY("fase") REFERENCES "fase"("fase");
ALTER TABLE
    "interessado" ADD CONSTRAINT "interessado_tipo_interv_foreign" FOREIGN KEY("tipo_interv") REFERENCES "tipo_interveniente"("tipo_interv");
ALTER TABLE
    "processo" ADD CONSTRAINT "processo_proc_id_foreign" FOREIGN KEY("proc_id") REFERENCES "proc_info"("proc_id");
ALTER TABLE
    "embargo_hist" ADD CONSTRAINT "embargo_hist_proc_id_foreign" FOREIGN KEY("proc_id") REFERENCES "processo"("proc_id");
ALTER TABLE
    "interessado" ADD CONSTRAINT "interessado_proc_id_foreign" FOREIGN KEY("proc_id") REFERENCES "processo"("proc_id");
ALTER TABLE
    "processo" ADD CONSTRAINT "processo_proc_id_foreign" FOREIGN KEY("proc_id") REFERENCES "Loc_obra"("proc_id");
ALTER TABLE
    "prazo_hist" ADD CONSTRAINT "prazo_hist_proc_id_foreign" FOREIGN KEY("proc_id") REFERENCES "processo"("proc_id");
ALTER TABLE
    "prazo_hist" ADD CONSTRAINT "prazo_hist_prazo_tipo_foreign" FOREIGN KEY("prazo_tipo") REFERENCES "prazo"("tipo");
ALTER TABLE
    "fase_hist" ADD CONSTRAINT "fase_hist_fase_foreign" FOREIGN KEY("fase") REFERENCES "fase"("fase");
