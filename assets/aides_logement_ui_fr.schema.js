export const uiSchema = {
    "ui:submitButtonOptions": {
        "submitText": "Lancer le calcul ! "
    },
    "menageIn": {
        "logement": {
            "modeOccupation": {
                "payload": {
                    "bailleur": {
                        "payload": {
                            "conventionneLivreIIITitreVChapIII": {
                                "ui:help": <span>Cochez cette case si le bailleur a signé une convention de logement social régie par le <a href="https://www.legifrance.gouv.fr/codes/section_lc/LEGITEXT000006074096/LEGISCTA000006159052/#LEGISCTA000006159052" target="_blank">chapitre III du titre V du livre III du code de la construction et de l'habitation</a>.</span>
                            },
                            "reductionLoyerSolidaritePercue": {
                                "ui:help": <span>La réduction de loyer de solidarité est prévue par l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038833816" target="_blank">article L442-2-1 du code de la construction et de l'habitation</a>.</span>
                            },
                            "conventionneLivreIIITitreIIChapISec3": {
                                "ui:help": <span>Cochez cette case le bailleur a signé une convention avec l'Agence Nationale de l'Habitat (ANAH) régie par le <a href="https://www.legifrance.gouv.fr/codes/section_lc/LEGITEXT000006074096/LEGISCTA000006177537/#LEGISCTA000006177537" target="_blank">chapitre Ier du titre II du livre III du code de la construction et de l'habitation</a>.</span>
                            }
                        },
                    },
                    "conventionneLivreIIITitreVChapIII": {
                        "ui:help": <span>Cochez cette case si le bailleur a signé une convention de logement social régie par le <a href="https://www.legifrance.gouv.fr/codes/section_lc/LEGITEXT000006074096/LEGISCTA000006159052/#LEGISCTA000006159052" target="_blank">chapitre III du titre V du livre III du code de la construction et de l'habitation</a>.</span>
                    },
                    "conventionneSelonReglesDrom": {
                        "ui:help": <span>Cochez cette case si le bailleur a signé une convention de logement social régie par l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000044899551/" target="_blank">article L861-5-1 du code de la construction et de l'habitation</a>. Début 2023, les décrets d'applications de cette mesure n'avaient cependant toujours pas été pris.</span>
                    },
                    "loyerPrincipal": {
                        "ui:help": <span>L'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038814916/" target="_blank">article L823-3 du code de la construction et de l'habitation</a>, notamment ses alinéas 4° et 6°, liste des sommes assimilables à des loyers pour des cas particuliers. Les articles <a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038878685" target="_blank">D842-2</a> et <a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000041477287/" target="_blank">D842-3</a> donnent également d'autres renseignements, mais l'article D842-2 est déjà pris en compte (pas la peine d'appliquer le coefficient de D842-2).</span>
                    },
                    "beneficiaireAideAdulteOuEnfantHandicapes": {
                        "ui:help": <span>Ces allocations sont respectivement prévues par l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000042920125/" target="_blank">article L821-1 du code de la sécurité sociale</a> et l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000006743350/" target="_blank">article L541-1 du même code</a>.</span>
                    },
                    "logementEstChambre": {
                        "ui:help": <span>Ce cas bénéficie d'un barème spécial prévu dans l'<a href="https://www.legifrance.gouv.fr/loda/article_lc/LEGIARTI000044137429" target="_blank">article 8 de l'arrêté du 27 septembre 2019 relatif au calcul des aides personnelles au logement et de la prime de déménagement</a>.</span>
                    },
                    "ageesOuHandicapAdultesHebergeesOnereuxParticuliers": {
                        "ui:help": <span>Ce cas bénéficie d'un barème spécial prévu dans l'<a href="https://www.legifrance.gouv.fr/loda/article_lc/LEGIARTI000044137429" target="_blank">article 8 de l'arrêté du 27 septembre 2019 relatif au calcul des aides personnelles au logement et de la prime de déménagement</a>.</span>
                    },
                    "colocation": {
                        "ui:help": <span>Ce cas est prévu par l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038878901/" target="_blank">article D823-18 du code de la construction et de l'habitation</a> et bénéficie d'un barème spécial régi par l'<a href="https://www.legifrance.gouv.fr/loda/article_lc/LEGIARTI000044137417" target="_blank">article 16 de l'arrêté du 27 septembre 2019 relatif au calcul des aides personnelles au logement et de la prime de déménagement</a>.</span>
                    },
                    "logementMeubleD8422": {
                        "ui:help": <span>Le caractère meublé du logement est apprécié au sens de l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038878685" target="blank">article D842-2 du code de la construction et de l'habitation</a>.</span>
                    },
                    "changementLogementD8424": {
                        "kind": {
                            "ui:help": <span>La liste des circonstances comptant comme un relogement pour cette question est donnée par l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038878681" target="_blank">article D842-4 du code de la construction et de l'habitation</a>.</span>
                        }
                    },
                    "categorieEquivalenceLoyerD84216": {
                        "kind": {
                            "ui:help": <span>Ces catégories de personnes sont définies par l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038878653" target="_blank">article D842-16 du code de la construction et de l'habitation</a>.</span>
                        }
                    },
                    "chargesMensuellesPret": {
                        "ui:help": <span>Les charges mensuelles du prêt sont mentionnées à l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038878665" target="_blank">article D842-11 du code de la construction et de l'habitation</a>.</span>
                    },
                    "typeTravauxLogementD83215": {
                        "kind": {
                            "ui:help": <span>La dichotomie sur la temporalité des travaux par rapport à l'acquisition vient des deux alinéas distincts de l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000039621211" target="_blank">article D832-15 du code de la construction et de l'habitation</a>.</span>
                        }
                    },
                    "typeTravauxLogementR8425": {
                        "kind": {
                            "ui:help": <span>Les différents objectifs des travaux  sont listés à l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000039048889" target="_blank">article R842-5 du code de la construction et de l'habitation</a>. Une liste d'objectifs est décrite par l'article <a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000043841799" target="_blank">R321-15</a> de ce même code.</span>
                        }
                    },
                    "localHabitePremiereFoisBeneficiaire": {
                        "ui:help": <span>Ce cas particulier est prévu par les articles <a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038878738/" target="_blank">D832-14</a> et <a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038878669" target="_blank">D842-9 du code de la construction et de l'habitation</a>.</span>
                    },
                    "ancienneteLogement": {
                        "kind": {
                            "ui:help": <span>Le critère d'ancienneté est utilisé au deuxième alinéa de l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038814880" target="_blank">article L831-2 du code de la construction et de l'habitation</a> mais aussi à l'<a href="https://www.legifrance.gouv.fr/loda/article_lc/LEGIARTI000046126970" target="_blank">article 18 de l'arrêté du 27 septembre 2019 relatif au calcul des aides personnelles au logement et de la prime de déménagement</a>.</span>
                        }
                    },
                    "copropriete": {
                        "ui:help": <span>Le cas d'un logement en co-propriété est prévu par l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038878734/2019-09-01" target="_blank">article D832-16 du code de la construction et de l'habitation</a>, et est régi par l'<a href="https://www.legifrance.gouv.fr/loda/article_lc/LEGIARTI000044137409" target="_blank">article 24 de l'arrêté du 27 septembre 2019</a>.</span>
                    },
                    "situationR822111317": {
                        "ui:help": <span>Le demandeur et/ou son conjoint se trouvent dans l'une des situations mentionnées aux articles <a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000041419384" target="_blank">R822-11</a> et <a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000041419372" target="_blank">R822-13</a> à <a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000041419333/" target="_blank">R822-17 du code de la construction et de l'habitation</a>.</span>,
                    },
                    "operationsLogementEvolutifsSociauxAccessionProprieteAideeEtat": {
                        "ui:help": <span>Voir les articles <a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038878583" target="_blank">D861-8</a> et <a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038878555" target="_blank">D862-7 du code de la construction et de l'habitation</a> pour plus d'informations.</span>
                    },
                    "pret": {
                        "typePret": {
                            "kind": {
                                "ui:help": <span>Les prêts donnant accès aux aides au logement sont régis par les articles <a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038975183" target="_blank">D331-32</a>, <a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038975933/" target="_blank">D331-63</a>, <a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000039012478" target="_blank">D331-64</a>, <a href="https://www.legifrance.gouv.fr/loda/article_lc/LEGIARTI000039048090/" target="_blank">D331-59-8</a> et <a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000039048319" target="_blank">D331-76-1 du code de la construction et de l'habitation</a>.</span>
                            }
                        },
                        "titulairePret": {
                            "kind": {
                                "ui:help": <span>Cette distinction est établie par l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000039048899" target="_blank">article R832-7 du code de la construction et de l'habitation</a>.</span>
                            }
                        },
                        "accordFinancementRepresentantEtatOutreMer": {
                            "kind": {
                                "ui:help": <span>L'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038814775" target="_blank">article L851-6 du code de la construction et de l'habitation</a> prévoit dans son 2° la possibilité d'un tel accord dérogatoire transitoirement en Guyane, en Martinique, en Guadeloupe, à La Réunion et à Mayotte.</span>
                            }
                        }
                    },
                    "typeUser": {
                        "kind": {
                            "ui:help": <span>Type de logement foyer selon la classification de l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038878722/">article R832-20 du code de la construction et de l'habitation</a>.</span>
                        }
                    },
                    "remplitConditionsR83221": {
                        "ui:help": <span>Voir l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000039048891/" target="_blank">article R832-21 du code de la construction et de l'habitation pour plus d'informations</a>. Attention, pour la Guadeloupe, la Guyane, la Martinique, La Réunion et Mayotte, voir l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000047398875" target="_blank">article R861-20</a> pour des conditions alternatives.</span>
                    }
                    ,
                    "construitApplicationLoi195712III": {
                        "ui:help": <span>Logement construit en application du III de l'article 12 de la <a href="https://www.legifrance.gouv.fr/jorf/id/JORFTEXT000000315837" target="_blank">loi n° 57-908 du 7 août 1957</a>.</span>
                    }
                }
            },
            "proprietaire": {
                "kind": {
                    "ui:help": <span>La propriété du logement pour cette question est à entendre selon le sens de l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038814942" target="_blank">article L822-3 du code de la construction et de l'habitation</a>. La fraction du logement revenant au demandeur ou à sa famille est un nombre entre 0 et 1 correspondant aux parts de propriétés, personnelles ou au travers de sociétés, détenues par le demandeur, son conjoint, ascendants et descendants.</span>
                }
            },
            "usufruit": {
                "kind": {
                    "ui:help": <span>L'usufruit du logement pour cette question est à entendre selon le sens de l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038814942" target="_blank">article L822-3 du code de la construction et de l'habitation</a>. La fraction du logement revenant au demandeur ou à sa famille est un nombre entre 0 et 1 correspondant aux parts d'usufruit, personnelles ou au travers de sociétés, détenues par le demandeur, son conjoint, ascendants et descendants.</span>
                }
            },
            "logementDecentL89462": {
                "ui:help": <span>Selon l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038814926/" target="_blank">article L822-9 du code de la construction et de l'habitation</a>, le logement doit répondre à des exigences de décence définies en application des deux premiers alinéas de l'<a href="https://www.legifrance.gouv.fr/loda/article_lc/LEGIARTI000037670751/" target="_blank">article 6 de la loi n° 89-462 du 6 juillet 1989 tendant à améliorer les rapports locatifs et portant modification de la loi n° 86-1290 du 23 décembre 1986</a>.</span>
            },
            "zone": {
                "ui:help": <span>La répartition des communes par zones est donnée par l'<a href="https://www.legifrance.gouv.fr/loda/id/JORFTEXT000000838189/" target="_blank">arrêté du 17 mars 1978 relatif au classement des communes par zones géographiques</a> et l'<a href="https://www.legifrance.gouv.fr/loda/article_lc/LEGIARTI000006831143" target="_blank">article 6 de l'arrêté du 5 mai 1995 relatif aux subventions de l'Etat et aux prêts pour la construction, l'acquisition et l'amélioration des logements locatifs aidés</a>.</span>
            }
        },
        "personnesACharge": {
            "items": {
                "payload": {
                    "nationalite": {
                        "payload": {
                            "satisfaitConditionsL5122CodeSecuriteSociale": {
                                "ui:help": <span>L'enfant satisfait les conditions des deux premiers alinéas de l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000042920150" target="_blank">article L512-2 du code de la sécurité sociale</a>.</span>
                            },
                            "satisfaitArt4Ordonnance2002Mayotte": {
                                "ui:help": <span>L'enfant satisfait les conditions de l'<a href="https://www.legifrance.gouv.fr/loda/article_lc/LEGIARTI000044405022" target="_blank">article 4 de l'ordonnance n° 2002-149 du 7 février 2022 relative à l'extension et la généralisation des prestations familiales et à la protection sociale dans le Département de Mayotte</a>.</span>
                            }
                        }
                    },
                    "obligationScolaire": {
                        "ui:help": <span>L'obligation scolaire d'un enfant est régie par les articles <a href="https://www.legifrance.gouv.fr/codes/section_lc/LEGITEXT000006071191/LEGISCTA000006166564/" target="_blank">L131-1 à L131-13 du code de l'éducation</a>.</span>
                    },
                    "remunerationMensuelle": {
                        "ui:help": <span>La rémunération mensuelle de l'enfant est nécessaire pour évaluer l'ouverture des droits aux prestations familiales selon l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000041979743" target="_blank">article L512-3 du code de la sécurité sociale</a>.</span>
                    },
                    "situationGardeAlternee": {
                        "kind": {
                            "ui:help": <span>Le coefficient de prise en charge est un nombre entre 0 et 1 qui reflète la période cumulée pendant laquelle le demandeur accueille l'enfant à son domicile, en conformité avec le considérant 4° de la <a href="https://www.legifrance.gouv.fr/ceta/id/CETATEXT000035260342/" target="_blank">décision n°398563 du 21 juillet 2017 du conseil d'État</a>.</span>
                        }
                    },
                    "etudesApprentissageStageFormationProImpossibiliteTravail": {
                        "ui:help": <span>Situation prévue par le 1° c) des articles <a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038814775" target="_blank">L861-6</a> et <a href="https://www.legifrance.gouv.fr/loda/article_lc/LEGIARTI000038814753" target="_blank">L862-3 du code de la construction et de l'habitation</a>.</span>
                    },
                    "titulaireAllocationPersonneAgee": {
                        "ui:help": <span>Information utilisée par le 2° de l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038878933/" target="_blank">article R823-4 du code de la construction et de l'habitation</a>.</span>
                    },
                    "beneficiaireL16119L3518L6433Secu": {
                        "ui:help": <span>Bénéficiaire des articles <a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000006740717/" target="_blank">L161-19</a>, <a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000028498855/" target="_blank">L351-8</a> ou <a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000028498667/" target="_blank">L643-3 du code de la sécurité sociale</a>. Information utilisée par le 2° de l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038878933/" target="_blank">article R823-4 du code de la construction et de l'habitation</a>.</span>
                    },
                    "incapacite80PourcentOuRestrictionEmploi": {
                        "ui:help": <span>Cette information est utilisée par le 5° de l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038814864" target="_blank">article L841-1</a> et le 3° de l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038878933/" target="_blank">article R823-4 du code de la construction et de l'habitation</a>.</span>
                    },
                    "ascendantDescendantCollateralDeuxiemeTroisiemeDegre": {
                        "ui:help": <span>Cette case est un prérequis de l'alinéa 5° de l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038814864" target="_blank">article L841-1 du code de la construction et de l'habitation</a>.</span>
                    }
                }
            }
        },
        "nombreAutresOccupantsLogement": {
            "ui:help": <span>Cette donnée est nécessaire pour le calcul de la surface minimale du logement à l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038878945" target="_blank">article R822-25 du code de la construction et de l'habitation</a>.</span>
        },
        "conditionRattacheFoyerFiscalParentIfi": {
            "ui:help": <span>Voir l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038814930" target="_blank">article L822-8 du code de la construction et de l'habitation pour plus d'informations</a>.</span>
        },
        "enfantANaitreApresQuatriemeMoisGrossesse": {
            "ui:help": <span>Cette question est nécessaire pour l'éligibilité à l'allocation de logement familiale (ALF) prévue au 6° de l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038814864" target="_blank">article L841-1 du code de la construction et de l'habitation</a>.</span>
        },
        "personnesAgeesHandicapeesFoyerR8444": {
            "ui:help": <span>Voir l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038878621" target="_blank">article L-844-4 du code de la construction et de l'habitation</a> pour plus d'informations.</span>
        },
        "residence": {
            "kind": {
                "ui:help": <span>Indiquez si le logement se situe en métropole ou dans une collectivité d'outre-mer.</span>
            }
        }
    },
    "demandeurIn": {
        "personneHebergeeCentreSoinLL162223SecuriteSociale": {
            "ui:help": <span>Ces unités ou centres de soins sont mentionnées mentionnés au 3° de l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000031688064" target="_blank">article L162-22 du code de la sécurité sociale</a>.</span>
        },
        "estNonSalarieAgricoleL7818L78146CodeRural": {
            "ui:help": <span>Ces travailleurs ont accès aux prestations sociales selon l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000032433388/" target="_blank">article L781-8</a> et l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000032433298" target="_blank">article L781-46 du code rural et de la pêche maritime</a>.</span>
        },
        "magistratFonctionnaireCentreInteretsMaterielsFamiliauxHorsMayotte": {
            "ui:help": <span>Ce cas est prévu par l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000038814771" target="_blank">article L861-8 du code de la construction et de l'habitation</a>.</span>
        },
        "nationalite": {
            "payload": {
                "satisfaitConditionsL5122CodeSecuriteSociale": {
                    "ui:help": <span>Le demandeur satisfait les conditions des deux premiers alinéas de l'<a href="https://www.legifrance.gouv.fr/codes/article_lc/LEGIARTI000042920150" target="_blank">article L512-2 du code de la sécurité sociale</a>.</span>
                },
                "satisfaitArt4Ordonnance2002Mayotte": {
                    "ui:help": <span>Le demandeur satisfait les conditions de l'<a href="https://www.legifrance.gouv.fr/loda/article_lc/LEGIARTI000044405022" target="_blank">article 4 de l'ordonnance n° 2002-149 du 7 février 2022 relative à l'extension et la généralisation des prestations familiales et à la protection sociale dans le Département de Mayotte</a>.</span>
                }
            }
        }
    },
    "ressourcesMenagePrisesEnCompteIn": {
        "ui:help": <span>Les ressources du ménages prises en compte pour le calcul des aides au logement doivent être appréciées selon la <a href="https://www.legifrance.gouv.fr/codes/section_lc/LEGITEXT000006074096/LEGISCTA000038814508/" target="_blank">section 2 du chapitre II du titre II du livre VIII du code de la construction et de l'habitation</a>.</span>
    }
}
