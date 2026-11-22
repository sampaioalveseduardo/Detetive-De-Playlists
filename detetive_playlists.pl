/* ==========================================================================
                    SISTEMA DE RECOMENDACAO DE PLAYLISTS
               Disciplina : Logica para Ciencias da Computacao

   ==========================================================================

   MODELO DOS DADOS:

   --------------------------------------------------------------------------
   ENTIDADES PRINCIPAIS:
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
   CONTEXTO DO USUARIO: (O que o usuario informa)
   --------------------------------------------------------------------------

     humor(Nome, Energia, Clima)
       Nome : feliz, triste, estressado, animado, motivado, nostalgico,
       romantico, relaxado
       Energia : baixa | media | alta
       Clima : alegre | melancolico | romantico | motivacional | neutro

     atividade(Nome, Energia, Ritmo)
       Nome : treino, estudo, festa, relaxar, viagem, trabalho, dirigir,
       cozinhar, dormir
       Energia : baixa | media | alta
       Ritmo : lento | moderado | acelerado

     horario(Periodo, Energia)
       Periodo  : madrugada | manha | tarde | noite
       Energia  : energia mais adequada para esse periodo

   --------------------------------------------------------------------------
   ASSOCIACOES:
   --------------------------------------------------------------------------

     humor_combina_genero(Humor, Genero)
     atividade_combina_genero(Atividade, Genero)
     genero_similar(Genero1, Genero2)

   ------------------------------------------------------------------------*/

/* =========================================================================

   FATOS DE APOIO:

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

/* =========================================================================

   FATOS DE MUSICAS E ASSOCIACOES:

   =========================================================================
   musica(Id, Titulo, Artista, Genero, Ano, Idioma, Ritmo, Energia, Clima)
   -------------------------------------------------------------------------*/

   % brasileiras:
   musica(m01, show_das_poderosas, anitta, pop, 2013, portugues, acelerado, alta, alegre).
   musica(m02, girl_from_rio, anitta, pop, 2021, ingles, moderado, media, alegre).
   musica(m03, tempo_perdido, legiao_urbana, rock, 1986, portugues, moderado, media, melancolico).
   musica(m04, eduardo_e_monica, legiao_urbana, rock, 1986, portugues, moderado, media, romantico).
   musica(m05, oceano, djavan, mpb, 1989, portugues, lento, baixa, romantico).
   musica(m06, sina, djavan, mpb, 1982, portugues, moderado, media, romantico).
   musica(m07, dia_branco, geraldo_azevedo, mpb, 1977, portugues, lento, baixa, romantico).
   musica(m08, construcao, chico_buarque, mpb, 1971, portugues, moderado, media, melancolico).
   musica(m09, asa_branca, luiz_gonzaga, forro, 1947, portugues, lento, baixa, melancolico).
   musica(m10, xote_das_meninas, luiz_gonzaga, forro, 1953, portugues, moderado, media, alegre).
   musica(m11, anunciacao, alceu_valenca, forro, 1983, portugues, moderado, media, romantico).
   musica(m12, as_rosas_nao_falam, cartola, samba, 1976, portugues, lento, baixa, melancolico).
   musica(m13, deixa_a_vida_me_levar, zeca_pagodinho, pagode, 2002, portugues, moderado, media, alegre).
   musica(m14, sosseguei, jorge_e_mateus, sertanejo, 2017, portugues, moderado, media, romantico).
   musica(m15, infiel, marilia_mendonca, sertanejo, 2016, portugues, moderado, media, melancolico).
   musica(m16, cheguei, ludmilla, funk, 2017, portugues, acelerado, alta, alegre).
   musica(m17, negro_drama, racionais_mcs, rap, 2002, portugues, moderado, media, melancolico).
   musica(m18, capitulo_4_versiculo_3, racionais_mcs, rap, 1997, portugues, moderado, alta, motivacional).
   musica(m19, amarelo, emicida, hip_hop, 2019, portugues, moderado, media, motivacional).
   musica(m20, levanta_e_anda, emicida, hip_hop, 2013, portugues, moderado, alta, motivacional).

   % internacionais:
   musica(m21, three_little_birds, bob_marley, reggae, 1977, ingles, lento, baixa, alegre).
   musica(m22, no_woman_no_cry, bob_marley, reggae, 1974, ingles, lento, baixa, melancolico).
   musica(m23, get_lucky, daft_punk, eletronica, 2013, ingles, moderado, alta, alegre).
   musica(m24, veridis_quo, daft_punk, eletronica, 2001, instrumental, moderado, media, neutro).
   musica(m25, bohemian_rhapsody, queen, rock, 1975, ingles, moderado, media, melancolico).
   musica(m26, dont_stop_me_now, queen, rock, 1979, ingles, acelerado, alta, alegre).
   musica(m27, maggie_may, rod_stewart, rock, 1971, ingles, moderado, media, melancolico).
   musica(m28, fix_you, coldplay, pop, 2005, ingles, lento, baixa, melancolico).
   musica(m29, viva_la_vida, coldplay, pop, 2008, ingles, moderado, alta, motivacional).
   musica(m30, blinding_lights, the_weeknd, pop, 2019, ingles, acelerado, alta, alegre).
   musica(m31, ocean_eyes, billie_eilish, pop, 2016, ingles, lento, baixa, romantico).
   musica(m32, bad_guy, billie_eilish, pop, 2019, ingles, moderado, media, neutro).
   musica(m33, enter_sandman, metallica, metal, 1991, ingles, moderado, alta, motivacional).
   musica(m34, nothing_else_matters, metallica, metal, 1991, ingles, lento, baixa, romantico).
   musica(m35, so_what, miles_davis, jazz, 1959, instrumental, moderado, baixa, neutro).
   musica(m36, blue_in_green, miles_davis, jazz, 1959, instrumental, lento, baixa, melancolico).
   musica(m37, the_thrill_is_gone, bb_king, blues, 1969, ingles, lento, baixa, melancolico).
   musica(m38, let_it_happen, tame_impala, indie, 2015, ingles, acelerado, alta, motivacional).
   musica(m39, fur_elise, beethoven, classica, 1810, instrumental, lento, baixa, romantico).
   musica(m40, sonata_ao_luar, beethoven, classica, 1801, instrumental, lento, baixa, melancolico).

   % latinas e asiaticas:
   musica(m41, dakiti, bad_bunny, reggaeton, 2020, espanhol, moderado, media, alegre).
   musica(m42, titi_me_pregunto, bad_bunny, reggaeton, 2022, espanhol, moderado, alta, alegre).
   musica(m43, aruarian_dance, nujabes, lofi, 2004, instrumental, lento, baixa, neutro).
   musica(m44, hips_dont_lie, shakira, pop, 2006, ingles, moderado, alta, alegre).
   musica(m45, la_tortura, shakira, pop, 2005, espanhol, moderado, media, melancolico).
   musica(m46, malamente, rosalia, pop, 2018, espanhol, moderado, media, neutro).
   musica(m47, despecha, rosalia, pop, 2022, espanhol, acelerado, alta, alegre).
   musica(m48, el_cantante, willie_colon, salsa, 1978, espanhol, moderado, media, melancolico).
   musica(m49, corazon_sin_cara, prince_royce, bachata, 2010, espanhol, moderado, media, romantico).
   musica(m50, darte_un_beso, prince_royce, bachata, 2013, espanhol, moderado, media, romantico).

/* --------------------------------------------------------------------------
   Humor que combina com generos:
   humor_combina_genero(Humor, Genero)
   -------------------------------------------------------------------------- */

   % feliz:
   humor_combina_genero(feliz, pop).
   humor_combina_genero(feliz, pagode).
   humor_combina_genero(feliz, forro).
   humor_combina_genero(feliz, reggae).
   humor_combina_genero(feliz, salsa).

   % animado:
   humor_combina_genero(animado, funk).
   humor_combina_genero(animado, pop).
   humor_combina_genero(animado, eletronica).
   humor_combina_genero(animado, reggaeton).
   humor_combina_genero(animado, rock).
   humor_combina_genero(animado, salsa).

   % motivado:
   humor_combina_genero(motivado, rap).
   humor_combina_genero(motivado, hip_hop).
   humor_combina_genero(motivado, rock).
   humor_combina_genero(motivado, metal).
   humor_combina_genero(motivado, indie).
   humor_combina_genero(motivado, eletronica).

   % triste:
   humor_combina_genero(triste, blues).
   humor_combina_genero(triste, jazz).
   humor_combina_genero(triste, sertanejo).
   humor_combina_genero(triste, mpb).
   humor_combina_genero(triste, classica).
   humor_combina_genero(triste, samba).

   % nostalgico:
   humor_combina_genero(nostalgico, mpb).
   humor_combina_genero(nostalgico, forro).
   humor_combina_genero(nostalgico, samba).
   humor_combina_genero(nostalgico, rock).
   humor_combina_genero(nostalgico, reggae).

   % romantico:
   humor_combina_genero(romantico, bachata).
   humor_combina_genero(romantico, mpb).
   humor_combina_genero(romantico, sertanejo).
   humor_combina_genero(romantico, pop).
   humor_combina_genero(romantico, jazz).
   humor_combina_genero(romantico, classica).

   % relaxado:
   humor_combina_genero(relaxado, lofi).
   humor_combina_genero(relaxado, jazz).
   humor_combina_genero(relaxado, reggae).
   humor_combina_genero(relaxado, classica).
   humor_combina_genero(relaxado, mpb).

   % estressado:
   humor_combina_genero(estressado, lofi).
   humor_combina_genero(estressado, classica).
   humor_combina_genero(estressado, jazz).
   humor_combina_genero(estressado, blues).
   humor_combina_genero(estressado, reggae).

/* --------------------------------------------------------------------------
   Atividades que combinam com generos:
   atividade_combina_genero(Atividade, Genero)
   -------------------------------------------------------------------------- */

   % treino:
   atividade_combina_genero(treino, metal).
   atividade_combina_genero(treino, rap).
   atividade_combina_genero(treino, hip_hop).
   atividade_combina_genero(treino, funk).
   atividade_combina_genero(treino, eletronica).
   atividade_combina_genero(treino, rock).

   % festa:
   atividade_combina_genero(festa, funk).
   atividade_combina_genero(festa, reggaeton).
   atividade_combina_genero(festa, salsa).
   atividade_combina_genero(festa, pagode).
   atividade_combina_genero(festa, forro).
   atividade_combina_genero(festa, pop).
   atividade_combina_genero(festa, sertanejo).

   % trabalho:
   atividade_combina_genero(trabalho, indie).
   atividade_combina_genero(trabalho, pop).
   atividade_combina_genero(trabalho, mpb).
   atividade_combina_genero(trabalho, jazz).
   atividade_combina_genero(trabalho, lofi).

   % viagem:
   atividade_combina_genero(viagem, rock).
   atividade_combina_genero(viagem, pop).
   atividade_combina_genero(viagem, sertanejo).
   atividade_combina_genero(viagem, mpb).
   atividade_combina_genero(viagem, reggae).
   atividade_combina_genero(viagem, indie).

   % dirigir:
   atividade_combina_genero(dirigir, rock).
   atividade_combina_genero(dirigir, pop).
   atividade_combina_genero(dirigir, metal).
   atividade_combina_genero(dirigir, sertanejo).
   atividade_combina_genero(dirigir, eletronica).
   atividade_combina_genero(dirigir, indie).

   % cozinhar:
   atividade_combina_genero(cozinhar, samba).
   atividade_combina_genero(cozinhar, pagode).
   atividade_combina_genero(cozinhar, mpb).
   atividade_combina_genero(cozinhar, salsa).
   atividade_combina_genero(cozinhar, jazz).
   atividade_combina_genero(cozinhar, reggae).
   atividade_combina_genero(cozinhar, bachata).

   % estudo:
   atividade_combina_genero(estudo, lofi).
   atividade_combina_genero(estudo, classica).
   atividade_combina_genero(estudo, jazz).

   % relaxar:
   atividade_combina_genero(relaxar, reggae).
   atividade_combina_genero(relaxar, mpb).
   atividade_combina_genero(relaxar, jazz).
   atividade_combina_genero(relaxar, blues).
   atividade_combina_genero(relaxar, lofi).
   atividade_combina_genero(relaxar, classica).

   % dormir:
   atividade_combina_genero(dormir, classica).
   atividade_combina_genero(dormir, lofi).
   atividade_combina_genero(dormir, jazz).
   atividade_combina_genero(dormir, blues).

/* --------------------------------------------------------------------------
   Generos similares: pares de generos parecidos.
   genero_similar(Genero1, Genero2)
   -------------------------------------------------------------------------- */

   genero_similar(rock, metal).
   genero_similar(metal, rock).
   genero_similar(rock, indie).
   genero_similar(indie, rock).
   genero_similar(rock, blues).
   genero_similar(blues, rock).
   genero_similar(indie, pop).
   genero_similar(pop, indie).
   genero_similar(pop, eletronica).
   genero_similar(eletronica, pop).
   genero_similar(pop, sertanejo).
   genero_similar(sertanejo, pop).
   genero_similar(rap, hip_hop).
   genero_similar(hip_hop, rap).
   genero_similar(funk, rap).
   genero_similar(rap, funk).
   genero_similar(funk, reggaeton).
   genero_similar(reggaeton, funk).
   genero_similar(reggae, reggaeton).
   genero_similar(reggaeton, reggae).
   genero_similar(salsa, bachata).
   genero_similar(bachata, salsa).
   genero_similar(samba, pagode).
   genero_similar(pagode, samba).
   genero_similar(mpb, samba).
   genero_similar(samba, mpb).
   genero_similar(forro, mpb).
   genero_similar(mpb, forro).
   genero_similar(forro, sertanejo).
   genero_similar(sertanejo, forro).
   genero_similar(jazz, blues).
   genero_similar(blues, jazz).
   genero_similar(jazz, lofi).
   genero_similar(lofi, jazz).
   genero_similar(jazz, classica).
   genero_similar(classica, jazz).
   genero_similar(lofi, classica).
   genero_similar(classica, lofi).
   genero_similar(eletronica, lofi).
   genero_similar(lofi, eletronica).

/* =========================================================================

   REGRAS DE CLASSIFICACAO:

   =========================================================================
   Cada regra recebe o Id de uma musica e diz se ela pertence a uma
   categoria. As basicas usam so os atributos de musica e as de
   combinacao reaproveitam outras regras ou cruzam com artista e ritmo.
   ------------------------------------------------------------------------- */

/* --------------------------------------------------------------------------
  Por energia:
  -------------------------------------------------------------------------- */

% energetica(Id): Musica tem energia alta (agita, empolga).
  energetica(Id) :-
    musica(Id, _, _, _, _, _, _, alta, _).

% calma(Id): Musica tem energia baixa (acalma, para descansar).
  calma(Id) :-
    musica(Id, _, _, _, _, _, _, baixa, _).

% energia_media(Id): nem agita, nem acalma, serve para o dia a dia.
  energia_media(Id) :-
    musica(Id, _, _, _, _, _, _, media, _).

/* --------------------------------------------------------------------------
  Por ritmo:
  -------------------------------------------------------------------------- */

% acelerada(Id): ritmo acelerado (130 bpm).
  acelerada(Id) :-
    musica(Id, _, _, _, _, _, acelerado, _, _).

% lenta(Id): ritmo lento (70 bpm).
  lenta(Id) :-
    musica(Id, _, _, _, _, _, lento, _, _).

/* --------------------------------------------------------------------------
  Por clima:
  -------------------------------------------------------------------------- */

% alegre(Id): base para recomendar por humor feliz/animado.
  alegre(Id) :-
    musica(Id, _, _, _, _, _, _, _, alegre).

% melancolica(Id): base para recomendar por humor triste/nostalgico.
  melancolica(Id) :-
    musica(Id, _, _, _, _, _, _, _, melancolico).

% romantica(Id): base para recomendar por humor romantico.
  romantica(Id) :-
    musica(Id, _, _, _, _, _, _, _, romantico).

/* motivacional(Id): base para recomendar por humor motivado e atividades
 de energia alta. */
  motivacional(Id) :-
    musica(Id, _, _, _, _, _, _, _, motivacional).

/* --------------------------------------------------------------------------
  Por epoca:
  -------------------------------------------------------------------------- */

% recente(Id): lancada de 2010 em diante, ultima decada.
  recente(Id) :-
    musica(Id, _, _, _, Ano, _, _, _, _),
    Ano >= 2010.

/* intermediaria(Id): lancada de 2000 a 2009, entre antiga e recente,
 para que toda musica caia numa faixa. */
  intermediaria(Id) :-
    musica(Id, _, _, _, Ano, _, _, _, _),
    Ano >= 2000,
    Ano < 2010.

% antiga(Id): lancada antes de 2000, nos seculos passados.
   antiga(Id) :-
    musica(Id, _, _, _, Ano, _, _, _, _),
    Ano < 2000.

/* --------------------------------------------------------------------------
  Classificacoes distintas:
  -------------------------------------------------------------------------- */

% instrumental(Id): musicas instrumentais.
  instrumental(Id) :-
    musica(Id, _, _, _, _, instrumental, _, _, _).

/* --------------------------------------------------------------------------
  Por combinacao: (mais de um atributo ou predicado):
  Reaproveitam as regras acima e cruzam musica com outros fatos.
  -------------------------------------------------------------------------- */

% hit_recente(Id): recente e energetica, ou seja, sucesso atual.
  hit_recente(Id) :-
    recente(Id),
    energetica(Id).

/* trilha_de_foco(Id): instrumental e calma, sem letra para distrair
 (estudo). */
  trilha_de_foco(Id) :-
    instrumental(Id),
    calma(Id).

% serenata(Id): romantica e calma, para momentos a dois.
  serenata(Id) :-
    romantica(Id),
    calma(Id).

% brasileira(Id): artista de origem brasileira (cruza musica com artista).
  brasileira(Id) :-
    musica(Id, _, Artista, _, _, _, _, _, _),
    artista(Artista, brasil, _).

% bpm_da_musica(Id, Bpm): bpm medio do ritmo da musica (cruza com ritmo).
  bpm_da_musica(Id, Bpm) :-
    musica(Id, _, _, _, _, _, Ritmo, _, _),
    ritmo(Ritmo, Bpm).

/* ==========================================================================

   REGRAS DE COMPATIBILIDADE:

   ==========================================================================
   Ligam uma musica ao contexto informado pelo usuario (humor, atividade,
   horario). Recebem o Id da musica e o contexto.
   -------------------------------------------------------------------------*/

/* --------------------------------------------------------------------------
   Compatibilidade com o contexto do usuario
   -------------------------------------------------------------------------- */

/* combina_humor(Id, Humor): a musica tem a energia e o clima que o humor
   pede. Os dois atributos sao obrigatorios. */
  combina_humor(Id, Humor) :-
    humor(Humor, Energia, Clima),
    musica(Id, _, _, _, _, _, _, Energia, Clima).

/* humor_ideal(Id, Humor): combina com o humor e o genero da musica e
   tipico desse humor. E a compatibilidade mais forte. */
  humor_ideal(Id, Humor) :-
    combina_humor(Id, Humor),
    musica(Id, _, _, Genero, _, _, _, _, _),
    humor_combina_genero(Humor, Genero).

/* combina_atividade(Id, Atividade): a energia da musica e a da atividade
   e mais um dos dois criterios abaixo. As duas clausulas funcionam como
   "ou". */

% Criterio 1: o ritmo da musica e o da atividade.
  combina_atividade(Id, Atividade) :-
    atividade(Atividade, Energia, Ritmo),
    musica(Id, _, _, _, _, _, Ritmo, Energia, _).

/* Criterio 2: o genero e tipico da atividade (atividade_combina_genero).
   O "\=" exclui as musicas que ja entraram no criterio 1, para nao
   aparecerem repetidas. Este criterio cobre musicas de ritmo moderado e
   energia alta ou baixa, que o ritmo sozinho deixaria sem nenhuma
   atividade. */
  combina_atividade(Id, Atividade) :-
    atividade(Atividade, Energia, Ritmo),
    musica(Id, _, _, Genero, _, _, RitmoMusica, Energia, _),
    RitmoMusica \= Ritmo,
    atividade_combina_genero(Atividade, Genero).

/* combina_horario(Id, Periodo): a energia da musica e a mais adequada para
   o periodo do dia: calma de madrugada e a noite, media de manha,
   energetica a tarde.*/
  combina_horario(Id, Periodo) :-
    horario(Periodo, Energia),
    musica(Id, _, _, _, _, _, _, Energia, _).

/* --------------------------------------------------------------------------
   Filtragem por genero, artista e idioma:
   Servem para o usuario restringir a busca.
   -------------------------------------------------------------------------- */

%  do_genero(Id, Genero): a musica pertence ao genero.
  do_genero(Id, Genero) :-
    musica(Id, _, _, Genero, _, _, _, _, _).

/* da_familia(Id, Familia): o genero da musica pertence a familia.
   Filtro mais amplo que do_genero. */
  da_familia(Id, Familia) :-
    musica(Id, _, _, Genero, _, _, _, _, _),
    genero(Genero, Familia).

%  do_artista(Id, Artista): a musica e do artista.
  do_artista(Id, Artista) :-
    musica(Id, _, Artista, _, _, _, _, _, _).

/* no_idioma(Id, Idioma): a letra da musica esta no idioma
   (instrumental para musicas sem letra). */
  no_idioma(Id, Idioma) :-
    musica(Id, _, _, _, _, Idioma, _, _, _).

/* ==========================================================================

   REGRAS DE RECOMENDACAO E PLAYLIST:

   ==========================================================================
   Regras de recomendacao combinada, regras de recomendacao similar e
   montagem de playlist a partir das recomendacoes e quantidade de
   musicas
   -------------------------------------------------------------------------*/

/* recomendar(Id, Humor, Atividade, Horario, Genero)
   recomendacao combinada. A musica precisa combinar com o humor,
   atividade e o horario, com opcao do genero preferido */

 recomendar(Id, Humor, Atividade, Horario, Genero) :-
    combina_humor(Id, Humor),
    combina_atividade(Id, Atividade),
    combina_horario(Id, Horario),
    do_genero(Id, Genero).

/* recomendar_sem_genero(Id, Humor, Atividade, Horario)
   util quando o usuario quer apenas algo que combine com o momento */

 recomendar_sem_genero(Id, Humor, Atividade, Horario) :-
    combina_humor(Id, Humor),
    combina_atividade(Id, Atividade),
    combina_horario(Id, Horario).

/* recomendar_ideal(Id, Humor, Atividade, Horario):
   recomendacao a partir da regra humor_ideal, junto com atividade e horario. */

  recomendar_ideal(Id, Humor, Atividade, Horario) :-
    humor_ideal(Id, Humor),
    combina_atividade(Id, Atividade),
    combina_horario(Id, Horario).

/* recomendar_da_familia(Id, Humor, Atividade, Horario, Familia):
   recomendacao combinada, mas toma-se como filtro, a familia do genero */

  recomendar_da_familia(Id, Humor, Atividade, Horario, Familia) :-
    combina_humor(Id, Humor),
    combina_atividade(Id, Atividade),
    combina_horario(Id, Horario),
    da_familia(Id, Familia).

/* musica_similar(Id, Genero):
   a musica e de um genero parecido com o informado. */

  musica_similar(Id, Genero) :-
    genero_similar(Genero, GeneroParecido),
    do_genero(Id, GeneroParecido).

/* recomendar_similar(Id, Humor, Atividade, Horario, Genero):
   recomendacao combinada aceitando generos similares ao preferido. */

  recomendar_similar(Id, Humor, Atividade, Horario, Genero) :-
    musica_similar(Id, Genero),
    combina_humor(Id, Humor),
    combina_atividade(Id, Atividade),
    combina_horario(Id, Horario).

/* --------------------------------------------------------------------------
   Algoritmo para criacao de playlists a partir do humor, atividade,
   horario, genero, quantidade de musicas e os titulos.
   -------------------------------------------------------------------------- */

% Definicao de um algoritmo que gera uma lista limitada a N

% Clausula 1: N = 0, retorna lista vazia
  primeirosids(_, 0, []) :- !.
% Clausula 2: Lista zerou e nao ha mais musicas, retorna lista vazia
  primeirosids([], _, []) :- !.
% Clausula 3: Cria a lista limitada, recebendo uma lista e a quantidade
  primeirosids([X|Xs], N, [X|Ys]) :-
    N > 0,
    N1 is N - 1,
    primeirosids(Xs, N1, Ys).

% Definicao do algoritmo que cria a playlist.

  playlist(Humor, Atividade, Horario, Genero, N, Titulos) :-
    % Nivel 1: bate com humor, atividade, horario e genero
    findall(Id, recomendar(Id, Humor, Atividade, Horario, Genero), Exatas),
    % Nivel 2: mesmo contexto, mas de generos parecidos ao escolhido
    findall(Id, recomendar_similar(Id, Humor, Atividade, Horario, Genero), Similares),
    % Nivel 3 (plano B): humor, atividade e genero, sem exigir o horario
    findall(Id, (combina_humor(Id, Humor), combina_atividade(Id, Atividade), do_genero(Id, Genero)), SemHorario),
    % Nivel 4 (plano B): apenas humor e genero
    findall(Id, (combina_humor(Id, Humor), do_genero(Id, Genero)), SoHumor),
    % Junta os niveis em ordem de prioridade
    append([Exatas, Similares, SemHorario, SoHumor], Todas),
    % Remove repetidas
    list_to_set(Todas, SemRepetir),
    % Cria a lista limitada a N
    primeirosids(SemRepetir, N, Escolhidas),
    % Troca cada id pelo titulo da musica
    findall(T, (member(Id, Escolhidas), musica(Id, T, _, _, _, _, _, _, _)), Titulos),

    % Avisa quando a playlist veio menor que o pedido
    length(Titulos, Qtd),
    ( Qtd < N -> writeln('Aviso: a playlist veio menor que o pedido.') ; true ).

/* COMO O ALGORITMO FUNCIONA:
 O playlist/6 monta a lista em niveis, do mais exigente ao mais flexivel:
    1) musicas que combinam com humor, atividade, horario e genero;
    2) o mesmo contexto, mas de generos parecidos ao escolhido;
    3) plano B: humor, atividade e genero, sem exigir o horario;
    4) plano B: apenas humor e genero.
  Os niveis sao juntados nessa ordem e as repetidas sao removidas, entao
  as melhores musicas ficam na frente. O primeirosids guarda so as N
  primeiras e cada id vira o titulo da musica. Se a playlist sair menor
  que o pedido, um aviso e exibido. */
