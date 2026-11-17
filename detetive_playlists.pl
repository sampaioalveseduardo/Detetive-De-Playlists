/* ==========================================================================
                    SISTEMA DE RECOMENDACAO DE PLAYLISTS
               Disciplina : Logica para Ciencias da Computacao

   ==========================================================================

   MODELO DOS DADOS:

   --------------------------------------------------------------------------
   ENTIDADES PRINCIPAIS
   --------------------------------------------------------------------------

     musica(Id, Titulo, Artista, Genero, Ano, Idioma, Ritmo, Energia,
            Clima)
       Id      : identificador
       Titulo  : nome da musica
       Artista : nome do autor
       Genero  : estilo musical
       Ano     : ano de lancamento
       Idioma  : lingua da letra escrita
       Ritmo   : cadencia da musica
       Energia : baixa | media | alta
       Clima   : alegre | melancolico | romantico | motivacional | neutro

     artista(Nome, Pais, GeneroPrincipal)
       Nome            : nome do artista
       Pais            : pais de origem
       GeneroPrincipal : genero dominante

     genero(Nome, Familia)
       Nome    : nome do genero
       Familia : agrupamento

     idioma(Nome, Regiao)
       Nome   : idioma da letra (ex: portugues, ingles, espanhol)
       Regiao : regiao predominante (ex: brasil, europa)

     ritmo(Nome, BpmMed)
       Nome   : lento | moderado | acelerado
       BpmMed : batidas por minuto medias da faixa

   --------------------------------------------------------------------------
   CONTEXTO DO USUARIO (O que o usuario informa)
   --------------------------------------------------------------------------

     humor(Nome, Energia, Clima)
       Nome     : feliz, triste, estressado, animado
       Energia  : baixa | media | alta
       Clima    : alegre | melancolico | romantico | motivacional | neutro

     atividade(Nome, Energia, Ritmo)
       Nome     : treino, estudo, festa, relaxar, viagem, trabalho
       Energia  : baixa | media | alta
       Ritmo    : lento | moderado | acelerado

     horario(Periodo, Energia)
       Periodo  : madrugada | manha | tarde | noite
       Energia  : energia mais adequada para esse periodo

   --------------------------------------------------------------------------
   ASSOCIACOES
   --------------------------------------------------------------------------

     humor_combina_genero(Humor, Genero)
     atividade_combina_genero(Atividade, Genero)
     genero_similar(Genero1, Genero2)

   ------------------------------------------------------------------------*/
