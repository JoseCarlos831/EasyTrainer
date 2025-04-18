const { Model, DataTypes } = require('sequelize');
const sequelize = require('../../config/db');

class Usuario extends Model {
  static init(sequelize) {
    super.init({
      id_usuario: {
        type: DataTypes.INTEGER,
        primaryKey: true,
        autoIncrement: true,
        field: 'id_usuario',
      },
      email: {
        type: DataTypes.STRING,
        allowNull: false,
        unique: {
          msg: 'Este e-mail já está em uso.',
        },
        validate: {
          isEmail: {
            msg: 'O e-mail fornecido é inválido.',
          },
        },
      },
      senha: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
          len: {
            args: [6, 100],
            msg: 'A senha deve ter entre 6 e 100 caracteres.',
          },
        },
      },
      telefone: {
        type: DataTypes.STRING,
        allowNull: false,
        validate: {
          len: {
            args: [3, 255],
            msg: 'telefone precisa ter entre 3 e 255 caracteres.',
          },
        },
      },
    }, {
      sequelize,
      tableName: 'usuario',
      timestamps: true,
    });
    return this;
  }
}

module.exports = Usuario;
