class Contato{
  int id ;
  String nome;
  String email;
  String imagem;

 Contato(this.id,this.nome,this.email,this.imagem);

 Map<String,dynamic> toMap() {
   Map<String,dynamic> map = {
     'id':this.id,
     'nome':this.nome,
     'email':this.email,
     'imagem':this.imagem,
   };
   return map;
 }
 Contato.fromMap(Map<String,dynamic> map){
   this.id = map['id'];
   this.nome = map['nome'];
   this.email = map['email'];
   this.imagem = map['imagem'];

 }

 @override
 String toString(){
   return "Contato => (id: $id, nome: $nome, email: $email, imagem: $imagem,)";
}

}