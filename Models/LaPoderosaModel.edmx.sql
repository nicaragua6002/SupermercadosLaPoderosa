
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 09/01/2022 13:27:11
-- Generated from EDMX file: C:\Users\MLC31\source\repos\SupermercadosLaPoderosa\Models\LaPoderosaModel.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [LaPoderosaBD];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------


-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------


-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Proveedores'
CREATE TABLE [dbo].[Proveedores] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Categorias'
CREATE TABLE [dbo].[Categorias] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL
);
GO

-- Creating table 'Productos'
CREATE TABLE [dbo].[Productos] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [NombreProducto] nvarchar(max)  NOT NULL,
    [CantidadPorUnidad] nvarchar(max)  NOT NULL,
    [PrecioUnidad] decimal(18,0)  NOT NULL,
    [UnidadesEnExistencia] nvarchar(max)  NOT NULL,
    [Img] tinyint  NULL,
    [ProveedorId] int  NOT NULL,
    [CategoriaId] int  NOT NULL
);
GO

-- Creating table 'Recetas'
CREATE TABLE [dbo].[Recetas] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Preparacion] nvarchar(max)  NOT NULL,
    [Img] tinyint  NULL
);
GO

-- Creating table 'Ingredientes'
CREATE TABLE [dbo].[Ingredientes] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Nombre] nvarchar(max)  NOT NULL,
    [Porcion] nvarchar(max)  NOT NULL,
    [RecetaId] int  NOT NULL,
    [ProductoId] int  NOT NULL
);
GO

-- Creating table 'Comentarios'
CREATE TABLE [dbo].[Comentarios] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Contenido] nvarchar(max)  NOT NULL,
    [Fecha] nvarchar(max)  NOT NULL,
    [Usuario] nvarchar(max)  NOT NULL,
    [RecetaId] int  NOT NULL
);
GO

-- Creating table 'Valoraciones'
CREATE TABLE [dbo].[Valoraciones] (
    [Id] int IDENTITY(1,1) NOT NULL,
    [Valor] nvarchar(max)  NOT NULL,
    [Fecha] nvarchar(max)  NOT NULL,
    [Usuario] nvarchar(max)  NOT NULL,
    [ProductoId] int  NOT NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [Id] in table 'Proveedores'
ALTER TABLE [dbo].[Proveedores]
ADD CONSTRAINT [PK_Proveedores]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Categorias'
ALTER TABLE [dbo].[Categorias]
ADD CONSTRAINT [PK_Categorias]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [PK_Productos]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Recetas'
ALTER TABLE [dbo].[Recetas]
ADD CONSTRAINT [PK_Recetas]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Ingredientes'
ALTER TABLE [dbo].[Ingredientes]
ADD CONSTRAINT [PK_Ingredientes]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Comentarios'
ALTER TABLE [dbo].[Comentarios]
ADD CONSTRAINT [PK_Comentarios]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- Creating primary key on [Id] in table 'Valoraciones'
ALTER TABLE [dbo].[Valoraciones]
ADD CONSTRAINT [PK_Valoraciones]
    PRIMARY KEY CLUSTERED ([Id] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [ProveedorId] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [FK_ProveedorProducto]
    FOREIGN KEY ([ProveedorId])
    REFERENCES [dbo].[Proveedores]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProveedorProducto'
CREATE INDEX [IX_FK_ProveedorProducto]
ON [dbo].[Productos]
    ([ProveedorId]);
GO

-- Creating foreign key on [CategoriaId] in table 'Productos'
ALTER TABLE [dbo].[Productos]
ADD CONSTRAINT [FK_CategoriaProducto]
    FOREIGN KEY ([CategoriaId])
    REFERENCES [dbo].[Categorias]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_CategoriaProducto'
CREATE INDEX [IX_FK_CategoriaProducto]
ON [dbo].[Productos]
    ([CategoriaId]);
GO

-- Creating foreign key on [ProductoId] in table 'Valoraciones'
ALTER TABLE [dbo].[Valoraciones]
ADD CONSTRAINT [FK_ProductoValoracion]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Productos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoValoracion'
CREATE INDEX [IX_FK_ProductoValoracion]
ON [dbo].[Valoraciones]
    ([ProductoId]);
GO

-- Creating foreign key on [RecetaId] in table 'Ingredientes'
ALTER TABLE [dbo].[Ingredientes]
ADD CONSTRAINT [FK_RecetaIngrediente]
    FOREIGN KEY ([RecetaId])
    REFERENCES [dbo].[Recetas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RecetaIngrediente'
CREATE INDEX [IX_FK_RecetaIngrediente]
ON [dbo].[Ingredientes]
    ([RecetaId]);
GO

-- Creating foreign key on [RecetaId] in table 'Comentarios'
ALTER TABLE [dbo].[Comentarios]
ADD CONSTRAINT [FK_RecetaComentario]
    FOREIGN KEY ([RecetaId])
    REFERENCES [dbo].[Recetas]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RecetaComentario'
CREATE INDEX [IX_FK_RecetaComentario]
ON [dbo].[Comentarios]
    ([RecetaId]);
GO

-- Creating foreign key on [ProductoId] in table 'Ingredientes'
ALTER TABLE [dbo].[Ingredientes]
ADD CONSTRAINT [FK_ProductoIngrediente]
    FOREIGN KEY ([ProductoId])
    REFERENCES [dbo].[Productos]
        ([Id])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_ProductoIngrediente'
CREATE INDEX [IX_FK_ProductoIngrediente]
ON [dbo].[Ingredientes]
    ([ProductoId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------