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

/* =========================================================================

   FATOS:

   =========================================================================
   Generos: Familia agrupa generos parecidos
   genero(Nome, Familia)
   -------------------------------------------------------------------------*/

 % familia: pop:

   genero(pop, pop).

 % familia: urbano:

   genero(funk, urbano).
   genero(hip_hop, urbano).
   genero(rap, urbano).
   genero(reggaeton, urbano).

% familia: rock:

   genero(rock, rock).
   genero(metal, rock).
   genero(indie, rock).


% familia: latino:

   genero(salsa, latino).
   genero(bachata, latino).

% familia: raizes brasileiras:

   genero(forro, raizes_brasileiras).
   genero(samba, raizes_brasileiras).
   genero(pagode, raizes_brasileiras).
   genero(mpb, raizes_brasileiras).

% familia: sertanejo:

   genero(sertanejo, sertanejo).

% familia: eletronico:

   genero(eletronica, eletronico).
   genero(lofi, eletronico).

% familia: afro_caribenho:

   genero(reggae, afro_caribenho).

% familia: jazz e blues:

   genero(jazz, jazz_blues).
   genero(blues, jazz_blues).

% familia: erudito:

   genero(classica, erudito).

/* --------------------------------------------------------------------------
    Idiomas:
    idioma(Nome, Regiao)
   ------------------------------------------------------------------------*/

   idioma(portugues, brasil).
   idioma(ingles, internacional).
   idioma(espanhol,  america_latina).
   idioma(instrumental, global).

/* --------------------------------------------------------------------------
    Ritmos:
    ritmo(Nome, Bpmmed)
   ------------------------------------------------------------------------*/

   ritmo(lento, 70).
   ritmo(moderado, 100).
   ritmo(acelerado, 130).

/* --------------------------------------------------------------------------
   Artistas: O genero principal precisa existir em genero/2.
   artista(Nome, Pais, GeneroPrincipal)
   -------------------------------------------------------------------------- */

   % brasileiros:
   artista(anitta,            brasil,  pop).
   artista(legiao_urbana,     brasil,  rock).
   artista(djavan,            brasil,  mpb).
   artista(geraldo_azevedo,   brasil,  mpb).
   artista(chico_buarque,     brasil,  mpb).
   artista(luiz_gonzaga,      brasil,  forro).
   artista(alceu_valenca,     brasil,  forro).
   artista(cartola,           brasil,  samba).
   artista(zeca_pagodinho,    brasil,  pagode).
   artista(jorge_e_mateus,    brasil,  sertanejo).
   artista(marilia_mendonca,  brasil,  sertanejo).
   artista(ludmilla,          brasil,  funk).
   artista(racionais_mcs,     brasil,  rap).
   artista(emicida,           brasil,  hip_hop).

   % nao-brasileiros:
   artista(bob_marley,       jamaica,       reggae).
   artista(daft_punk,        franca,        eletronica).
   artista(queen,            reino_unido,   rock).
   artista(rod_stewart,      reino_unido,   rock).
   artista(coldplay,         reino_unido,   pop).
   artista(the_weeknd,       canada,        pop).
   artista(billie_eilish,    eua,           pop).
   artista(metallica,        eua,           metal).
   artista(miles_davis,      eua,           jazz).
   artista(bb_king,          eua,           blues).
   artista(tame_impala,      australia,     indie).
   artista(beethoven,        alemanha,      classica).
   artista(bad_bunny,        porto_rico,    reggaeton).
   artista(nujabes,          japao,         lofi).
   artista(shakira,          colombia,      pop).
   artista(rosalia,          espanha,       pop).
   artista(willie_colon,     eua,           salsa).
   artista(prince_royce,     eua,           bachata).

/* --------------------------------------------------------------------------
   Humores: Energia e Clima indicam o tipo de musica que combina com o
   humor. humor(Nome, Energia, Clima)
   -------------------------------------------------------------------------- */

   humor(feliz,      media, alegre).
   humor(animado,    alta,  alegre).
   humor(motivado,   alta,  motivacional).
   humor(triste,     baixa, melancolico).
   humor(nostalgico, baixa, melancolico).
   humor(romantico,  baixa, romantico).
   humor(relaxado,   baixa, neutro).
   humor(estressado, baixa, neutro).

/* --------------------------------------------------------------------------
   Atividades:
   atividade(Nome, Energia, Ritmo)
   -------------------------------------------------------------------------- */

   % atividades de alta energia:
   atividade(treino,  alta,  acelerado).
   atividade(festa,   alta,  acelerado).

   % atividades de energia media:
   atividade(trabalho,  media, moderado).
   atividade(viagem,    media, moderado).
   atividade(dirigir,   media, moderado).
   atividade(cozinhar,  media, moderado).

   % atividades de baixa energia:
   atividade(estudo,   baixa, lento).
   atividade(relaxar,  baixa, lento).
   atividade(dormir,   baixa, lento).

/* --------------------------------------------------------------------------
   Horarios: Energia mais adequada para cada periodo do dia.
   horario(Periodo, Energia)
   -------------------------------------------------------------------------- */

   horario(madrugada, baixa).
   horario(manha,     media).
   horario(tarde,     alta).
   horario(noite,     baixa).
