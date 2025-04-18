const Usuario = require('../models/User');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');
const twilio = require('twilio');
const client = twilio(process.env.TWILIO_ACCOUNT_SID, process.env.TWILIO_AUTH_TOKEN);

exports.register = async (req, res) => {
  try {
    const { email, senha, telefone } = req.body;
    const senhaCriptografada = await bcrypt.hash(senha, 10);
    const usuario = await Usuario.create({ email, senha: senhaCriptografada, telefone });
    res.status(201).json({ message: 'Usuário registrado', usuario });
  } catch (err) {
    res.status(400).json({ error: err.message });
  }
};

exports.login = async (req, res) => {
  const { email, senha } = req.body;
  const usuario = await Usuario.findOne({ where: { email } });

  if (!usuario || !(await bcrypt.compare(senha, usuario.senha)))
    return res.status(401).json({ error: 'Credenciais inválidas' });

  const token = jwt.sign({ id_usuario: usuario.id_usuario }, process.env.JWT_SECRET, { expiresIn: '1h' });
  res.json({ token });
};

exports.recoverPassword = async (req, res) => {
  const { email } = req.body;
  const usuario = await Usuario.findOne({ where: { email } });

  if (!usuario)
    return res.status(404).json({ error: 'Usuário não encontrado' });

  const token = jwt.sign({ id_usuario: usuario.id_usuario }, process.env.JWT_RESET_SECRET, { expiresIn: '10m' });

  await client.messages.create({
    body: `Seu código de redefinição de senha é: ${token}`,
    from: process.env.TWILIO_PHONE_NUMBER,
    to: usuario.telefone,
  });

  res.json({ message: 'Código enviado por SMS' });
};
